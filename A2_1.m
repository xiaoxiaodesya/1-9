clc;
clear all;
close all;

%%

x_1 = 0.0;
y_1 = 1.0;

delta = logspace(-20, 5, 1000);
x_2 = delta;
y_2 = 1.0 + delta;

e = 2*10^(-16);
x_ex = 1;
x_num = (x_2 - x_1) / (y_2 - y_1);

X1 = abs(x_ex - x_num);




X2 = abs(e ./ (delta +e));
X3 = abs(-e ./ (delta - e));

% 用loglog以log坐标来画坐标
loglog(delta,X1,'b')
hold on

loglog(delta,X2,'g')
hold on

loglog(delta,X3,'r--')
hold on

grid on

