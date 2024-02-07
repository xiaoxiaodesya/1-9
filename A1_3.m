clc;
clear all;
close all

%% 1.3.1 画出正弦函数的图像

figure
x = linspace(-pi, pi, 200);
y = sin(x);
plot(x, y)
title('2D-plot')
xlabel('x')
ylabel('y = sin(x)')
grid on

%% 1.3.2 画出trisurf图像

figure
elements = [1, 2, 5, 4; 2, 3, 6, 5; 4, 5, 8, 7; 5, 6, 9, 8];
nodes = [-1,-1; 0, -1; 1, -1; -1, 0; 0, 0; 1, 0; -1, 1; 0, 1; 1, 1];
sol = [2, 1, 2, 1, 0, 1, 2, 1, 2]';
quadplot(nodes, elements, sol)

%% 1.3.3 画出trisurf图像

figure
[x,y] = meshgrid(-1:1,-1:1);
z = x.^2+y.^2;
T = delaunay(x,y,z);
trisurf(T,x,y,z)

