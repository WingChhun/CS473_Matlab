
% Load the sample data.
% Rename the column names of fisheriris
fisheriris = readtable("irisdata.csv"); %read from irisdata.csv file
load fisheriris
fisheriris.Properties.VariableNames = {'sepal_length' 'sepal_width' 'petal_length' 'petal_width' 'Class'};


%%
% The column vector, |species| , consists of iris flowers of three
% different species, setosa, versicolor, virginica. The double matrix
% |meas| consists of four types of measurements on the flowers, the length
% and width of sepals and petals in centimeters, respectively.
%%
% Use petal length (third column in |meas| ) and petal width (fourth column
% in |meas| ) measurements. Save these as variables PL and PW,
% respectively.
PL = meas(:,3);
PW = -meas(:,4);

%%
% Plot the data, showing the classification, that is, create a scatter plot
% of the measurements, grouped by species.
figure(1)
h1 = gscatter(PL,PW,species,'krb','ov^',[],'off');
h1(1).LineWidth = 2;
h1(2).LineWidth = 2;
h1(3).LineWidth = 2;
legend('Setosa','Versicolor','Virginica','Location','best')
hold on
%%
% Create a linear classifier.
X = [PL,PW];
MdlLinear = fitcdiscr(X,species);
%% 
% Retrieve the coefficients for the linear boundary between the second and
% third classes.
MdlLinear.ClassNames([2 3])
K = MdlLinear.Coeffs(2,3).Const;  
L = MdlLinear.Coeffs(2,3).Linear;
%%
% Plot the curve that separates the second and third classes 
%
% $$K + \left[\begin{array}{*{20}{c}}x_1 & x_2 \end{array}\right]L  = 0.$$
% 
f = @(x1,x2) K + L(1)*x1 + L(2)*x2;
h2 = ezplot(f,[.9 7.1 0 2.5]);
h2.Color = 'r';
h2.LineWidth = 2;
%%
% Retrieve the coefficients for the linear boundary between the first
% and second classes.
MdlLinear.ClassNames([1 2])
K = MdlLinear.Coeffs(1,2).Const;
L = MdlLinear.Coeffs(1,2).Linear; 
%%
% Plot the curve that separates the first and second classes.
f = @(x1,x2) K + L(1)*x1 + L(2)*x2;
h3 = ezplot(f,[.9 7.1 0 2.5]);
h3.Color = 'k';
h3.LineWidth = 2;
% axis([.9 7.1 0 2.5])
xlabel('Petal Length')
ylabel('Petal Width')
title('{\bf Linear Classification with Fisher Training Data}')
%hold off

%SOLUTIONS

%Problem5_1a

M = fitcdiscr(fisheriris,'Class'); %Classification discriminant function
CovarianceMatrix = M.BetweenSigma;
%
%Use covariance matrixes and output
%
Matrices = M.Sigma;
fprintf("Covariance matrix Sigma \n");
disp(Matrices);
fprintf("Single Covariance Matrix for fisher iris LDA \n\n");
disp(CovarianceMatrix);
%
%Get correlation coefficients and output
%
fprintf("Correlation coefficients \n\n");
Coefficient1 = M.Coeffs(1,2).Const;
Coefficient2 = M.Coeffs(2,1).Const;
Coefficient3 = M.Coeffs(3,1).Const;
%
%Display Coefficient constants
%
fprintf("Coefficient Class 1 is Negative \n"); 
 disp(Coefficient1);
fprintf("Coefficient Class 2 is Positive \n"); 
 disp(Coefficient2)
fprintf("Coefficient Class 3 is Negative \n"); 
 disp(Coefficient3)
 

