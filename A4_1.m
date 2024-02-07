clc;
clear;

%% 4.1 Finite-Differenzen-Approximation

x_0 = 0.6;
h = 0.1;

Zweipunkte_formel = (f(x_0 - h) - f(x_0)) / h
Dreipunkte_endpunkt_formel = 1 /(2*h) * (-3 * f(x_0) + 4 * f(x_0 + h) - f(x_0 + 2 * h ))
Dreipunkte_mittelpunkt_formel = 1 /(2*h) * (f(x_0 + h) - f(x_0 - h));
Fuenfpunkte_mittelpunkt_formel = 1 /(12*h) * (f(x_0 - 2*h) - 8 * f(x_0 - h) + 8 * f(x_0 + h) - f(x_0 + 2*h));


function y = f(x)
y = power((x ./ (1 + x)), 5);
end
