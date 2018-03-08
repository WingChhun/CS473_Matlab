
%James Chhun - Made 3/7/2018

%Arithmetic


A = [1:5; 1:5; 1:5];
B = [5:10; 10:15; 15:20];

C = A.*A; %For multiplicatrion, place a . before the * sign
D = A./A; %For division, do the same

%Display arithmetic
disp("Displaying sum of A and A matrices");
disp(A + A);

disp("Displaying product of matrix A and A");
disp(C);

disp("Displaying Quotient of C and A matrices");
disp(D);

disp("Size of matrix B");
size(B)

%TRIG and EXPONENTIAL STUFF
%
%pi
pie = pi; %pi 3.14 is a reservefd word
%get exponential E
exponential = exp(3);

%Use trig
sin();
cos();

% MATRIX HELPERS
%
%
%Get a identity matrix
IdentityMatrix = eye(3); % 3x3 identity matrix
%Matrix of all zeros using zeros()
zeroMatrix = zeros(3);
%Optionally pass in size
zeros(3,2);

%Matrix of all ones
onesMatrix = ones(3);
%Optionally pass in size
ones(3,2);