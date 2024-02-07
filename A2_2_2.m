

%% grad 4

x = 0: 0.005:4;
y = (x./(1+x)).^5;
x_4 = linspace(0, 4, 5);
y_4 = (x_4./(1+x_4)).^5;
dy = 5*(x.^4)./((1+x).^6);
dy_4 = 5*(x_4.^4)./((1+x_4).^6);

for a=1:length(x)
  wert_poly3(a) = LagrangePolynom(x(a),4,x_4,y_4,LagrangeBasis(x(a), 4, 5, x_4));
  wert_dpoly3(a) = LagrangeDerivPolynom(x(a),4,x_4,y_4,LagrangeDerivBasis(x(a), 4, 5, x_4));
end
wert_dpoly3
scatter(x_4, y_4, 'black', 'filled')
hold on

scatter(x_4, dy_4, 'black', 'filled')
hold on 

plot(x, wert_poly3, 'y', LineWidth = 2.5)
hold on

plot(x, wert_dpoly3,'m', LineWidth = 2.5)
hold on


plot(x, y, 'black', LineWidth = 2)
hold on

plot(x, dy, '-.black', LineWidth = 2)
hold on

title('L I V G 4')
xticks(0:0.5:4)
yticks([-0.05, 0, 0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35])
xlabel('x')
ylabel('f(x)')
grid on
legend({'Stützstellen', 'Stützstellen', 'Polynom P4', 'erste Ableitung Polynom P4', 'exakte Funktion f(x)', 'exakte Funktion f(x)'}, 'Location','northwest')
