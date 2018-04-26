%neural network

clear all;
close all;

TrainingIn=[0 1 0 1;
            0 0 1 1];
DesiredOut=[0 1 1 0];

W1=randn(2,2);
W2=randn(2,1);
b1=randn(2,1);
b2=randn(1,1);

%W1=[1 -1; -1 1]+0.1*randn(2,2);
%W2=[1 1]'+0.1*randn(2,1);
%b1=[-0.5 -0.5]';
%b2=-0.5;

StepSize=1.1;
ErrOutOverTime=[];

%W1=[

for tt=1:1000
  L1Out=sigmoid(W1*TrainingIn+b1*ones(1,4));
  NNout=sigmoid(W2'*L1Out+b2);

  ErrOut=DesiredOut-NNout;
  DeltaW1=zeros(2,2); DeltaW2=zeros(2,1); Deltab1=zeros(2,1); Deltab2=0;
  for oo=1:length(DesiredOut)
    DeltaW2=DeltaW2+ErrOut(oo).*NNout(:,oo).*(1-NNout(:,oo)).*L1Out(:,oo);
    tmp=ErrOut(oo).*NNout(:,oo).*(1-NNout(:,oo)).*L1Out(:,oo).*(1-L1Out(:,oo)).*W2;
    DeltaW1=DeltaW1+tmp*TrainingIn(:,oo)';
    Deltab1=Deltab1+tmp;
    Deltab2=Deltab2+ErrOut(oo).*NNout(:,oo).*(1-NNout(:,oo));
  end

  W1=W1+StepSize*DeltaW1./length(DesiredOut);
  W2=W2+StepSize*DeltaW2./length(DesiredOut);
  b1=b1+StepSize*Deltab1./length(DesiredOut);
  b2=b2+StepSize*Deltab2./length(DesiredOut);
  ErrOutOverTime=[ErrOutOverTime; ErrOut];
  
end

%calculate Mean Squared Error


figure;
plot(ErrOutOverTime);