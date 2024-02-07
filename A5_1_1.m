clc;
clear;

a = 0;
b = 4;

%% 5.1.1 Mittelpunktregel

I_M = (b - a) .* (f((b - a)./ 2));

%% 5.1.2 Trapezregel

I_T = (b - a) .* (f(a) + f(b)) ./ 2;

%% Function

function y = f(x)
y = power(x, 5) ./ power((1+x), 5);
end