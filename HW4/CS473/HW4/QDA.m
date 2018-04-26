%% Create and Visualize Discriminant Analysis Classifier
% This example shows how to perform linear and quadratic classification of
% Fisher iris data.
%%
% Load the sample data.
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
%%
% Create a quadratic discriminant classifier.
MdlQuadratic = fitcdiscr(X,species,'DiscrimType','quadratic');
%%
% Remove the linear boundaries from the plot.
% delete(h2);
% delete(h3); 
%%
% Retrieve the coefficients for the quadratic boundary between the
% second and third classes.
MdlQuadratic.ClassNames([2 3])
K = MdlQuadratic.Coeffs(2,3).Const;
L = MdlQuadratic.Coeffs(2,3).Linear; 
Q = MdlQuadratic.Coeffs(2,3).Quadratic;
%%
% Plot the data, showing the classification, that is, create a scatter plot
% of the measurements, grouped by species.
figure(2)
h1 = gscatter(PL,PW,species,'krb','ov^',[],'off');
h1(1).LineWidth = 2;
h1(2).LineWidth = 2;
h1(3).LineWidth = 2;
legend('Setosa','Versicolor','Virginica','Location','best')
hold on;
%%
% Plot the curve that separates the second and third classes
%
% $$K + \left[\begin{array}{*{20}{c}}x_1 & x_2 \end{array}\right]L +
% \left[\begin{array}{*{20}{c}}x_1 & x_2
% \end{array}\right]Q\left[\begin{array}{*{20}{c}}x_1 \\ x_2
% \end{array}\right] = 0.$$
% 
f = @(x1,x2) K + L(1)*x1 + L(2)*x2 + Q(1,1)*x1.^2 + ...
    (Q(1,2)+Q(2,1))*x1.*x2 + Q(2,2)*x2.^2;
h2 = ezplot(f,[.9 7.1 0 2.5]);
h2.Color = 'r';
h2.LineWidth = 2;
%%
% Retrieve the coefficients for the quadratic boundary between the
% first and second classes.
MdlQuadratic.ClassNames([1 2])
K = MdlQuadratic.Coeffs(1,2).Const;
L = MdlQuadratic.Coeffs(1,2).Linear; 
Q = MdlQuadratic.Coeffs(1,2).Quadratic;
%%
% Plot the curve that separates the first and second and classes.
f = @(x1,x2) K + L(1)*x1 + L(2)*x2 + Q(1,1)*x1.^2 + ...
    (Q(1,2)+Q(2,1))*x1.*x2 + Q(2,2)*x2.^2;
h3 = ezplot(f,[.9 7.1 0 1.02]); % Plot the relevant portion of the curve.
h3.Color = 'k';
h3.LineWidth = 2;
% axis([.9 7.1 0 2.5])
xlabel('Petal Length')
ylabel('Petal Width')
title('{\bf Quadratic Classification with Fisher Training Data}')
hold off

%SOLUTIONS
%Quadratic classification
M = fitcdiscr(meas,species,'DiscrimType','quadratic');
%Grab covariance matrices and print
SingleCoMatrix = M.BetweenSigma;
coMatrix1 = M.Sigma(:,:,1);
coMatrix2 = M.Sigma(:,:,2);
coMatrix3 = M.Sigma(:,:,3);
fprintf("Displaying Each covariance matrix \n\n");
disp(coMatrix1);
disp(coMatrix2);
disp(coMatrix3);