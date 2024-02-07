clear;
clc;

%%
A = [10.0, 2.0, 10.0; 2.0, 40.0, 8.0; 10.0, 8.0, 60.0];
b = [1.0;1.0;2.0];
x0 = [0.0;0.0;0.0];
rtol = 1e-7;
itermax = 1000;
A_1 = [10.0, 2, 1; 3, 4, 4; 1, 8, 4];

x_1 = solveGauss(A_1, b);
x_2 = solveG(A, b, x0, rtol, itermax);
x_3 = solveCG(A, b, x0, rtol, itermax);
