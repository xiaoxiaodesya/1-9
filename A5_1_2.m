clc;
clear;

a = 0;
b = 4;

%% 1. Gauß-Quadratur mit einer Stützstelle

I_G_1 = (b - a) ./2 .* sum(gw(1) .* f(((b - a) ./ 2) .* gx(1) + (a + b) ./ 2));

%% 2. Gauß-Quadratur mit zwei Stützstellen

I_G_2 = (b - a) ./2 .* sum(gw(2) .* f(((b - a) ./ 2) .* gx(2) + (a + b) ./ 2))

%% 3. Gauß-Quadratur mit drei Stützstellen

I_G_3 = (b - a) ./2 .* sum(gw(3) .* f(((b - a) ./ 2) .* gx(3) + (a + b) ./ 2))

%% Vergleichender Fehler mit der exakten Integration I = 0.556543771162832.

I = 0.556543771162832;
Fehler_1 = abs(I - I_G_1);
Fehler_2 = abs(I - I_G_2);
Fehler_3 = abs(I - I_G_3);

%% Function

function y = f(x)
y = (x ./ (1 + x)) .^ 5;
end
