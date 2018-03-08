%James Chhun
%Homework 2

%Question 1
%-Write the code that generates a Bernoulli sample with given parameter p,
%and the code that calculates p-hat from the sample
% -Plot the estiate of p(or p-hat) as a functino of the number of samples)

%solution
%Constants, variables
p = 0.2; 
x = rand(1,100); 
x_b = [];

for i = 1:length(x)
if(x(i) < p)
x_b = [x_b,1];
else 
x_b = [x_b,0];
end
end

sum = cumsum(x_b);
mean = cumsum(x_b)./[1:1:100];
plot(mean);