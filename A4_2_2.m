clc;
clear;

%% 4.2.1 Konvergenz der Finite-Differenzen-Approximation x_0 = 2.0
syms x

x_0 = 2.0;
h = logspace(-5, 0, 100);
df =  subs(diff(f(x)), x, x_0)

f_2P = abs(df - (f(x_0 - h) - f(x_0)) ./ h);
f_3PE = abs(df - 1 ./ (2.*h) .* (-3 .* f(x_0) + 4 .* f(x_0 + h) - f(x_0 + 2 .* h )));
f_3PM = abs(df - 1 ./(2.*h) .* (f(x_0 + h) - f(x_0 - h)));
f_5PM = abs(df - 1 ./(12.*h) .* (f(x_0 - 2.*h) - 8 .* f(x_0 - h) + 8 .* f(x_0 + h) - f(x_0 + 2.*h)));

loglog(h, f_2P, 'g', LineWidth = 1)
hold on

loglog(h, f_3PE, 'r', LineWidth = 1)
hold on

loglog(h, f_3PM, 'y', LineWidth = 1)
hold on

loglog(h, f_5PM, 'b', LineWidth = 1)
hold on

loglog(h, h, '.m', LineWidth = 1)
hold on

loglog(h, power(h, 2), '-.p', LineWidth = 1)
hold on

loglog(h, power(h, 4), '--black', LineWidth = 1)
hold on

legend({'f_2P', 'f_3PE', 'f_3PM', 'f_5PM', 'h', 'h^2', 'h^4'}, 'Location', 'northwest')
title('Konvergenzplot der Finite Differenzen')
xlabel('h')
ylabel('|df(x) - df(x)_approx|')
grid on
axis([10^-5,1,10^-20,10^1])

function y = f(x)
y = power((x ./ (1 + x)), 5);
end
