%Introduction to Matlab Part 1 - James Chhun 3/7/18

%Quick Note
%In the command prompt, write a variable without semiColon to display the
%value
%Else, will not display the contents of a variable

%1 .Assign value to a variable
%Without a semicolon at the end, the output of x will display in the console
x = 5; %x = a scalar value
%x =5 

% 2- Declare a matrix
% - Note, dont need commas can just use spaces
A = [1,2,3,4,5];
B = [1 2 3 4 5];

%Test Output Of matrixes
disp("Printing matrix A");
%A 


%get size of matrix
disp("Displaying size of matrix A and B");
%size(A) %size is 1 by 5
%size(B) %size 1 by 5

% 3 - How to declare a matrix with multiple rows
% - Use semi colons to denote the end of a row and start a new row
C = [1 2 3; 4 5 6; 7 8 9];
disp("Displaying 3x3 matrix C");
%Output
%C

%Display size of C, a 3x3
disp("Displaying size of C");
%size(C)

% 4 - Get the Transpose of a Matrix
% - use the ' (apostrophe) ona  amtrix to get the Transpose
CT = C';
disp("Displaying Transpose of matrix C in variable CT");
CT %Output CT transpose


% 5 - Random
% - Use random helper function rand(x,y)
% - Two parameters, designates the range, these numbers are less than 1
disp("Displaying 10 random numbers less than 1");
%rand(1:10) % Output 10 Random Numbers less than 1, 