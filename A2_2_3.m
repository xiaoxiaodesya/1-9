clc;
clear all;
close all;

%% grad 4

x = 0: 0.005:4;
y = (x./(1+x)).^5;
x_80 = linspace(0, 4, 81);
y_80 = (x_80./(1+x_80)).^5;
dy = 5*(x.^4)./((1+x).^6);
dy_80 = 5*(x_80.^4)./((1+x_80).^6);

for a=1:length(x)
  wert_poly3(a)=LagrangePolynom(x(a),80,x_80,y_80,LagrangeBasis(x(a), 80, 81, x_80));
  wert_dpoly3(a) = LagrangeDerivPolynom(x(a),80,x_80,y_80,LagrangeDerivBasis(x(a), 80, 81, x_80));
end

scatter(x_80, y_80, 'black', 'filled')
hold on











-


scatter(x_80, dy_80, 'black', 'filled')
hold on

plot(x, wert_poly3, 'm')
hold on

plot(x, wert_dpoly3,'b')
hold on


plot(x, y, 'black')
hold on

plot(x, dy, '-.black')
hold on

title('L I V G 4')
axis([0 4 -0.05 0.35])
xlabel('x')
ylabel('f(x)')
grid on
legend({'Stützstellen', 'Stützstellen', 'Polynom P4', 'erste Ableitung Polynom P4', 'exakte Funktion f(x)', 'exakte Funktion f(x)'}, 'Location','northwest')

