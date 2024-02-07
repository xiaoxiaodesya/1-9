clear;
clc;

%%
r = 0.02;
b = 0.3;
h = 0.3;
ts = 5000;
t = 0:500:5000;
timestep = 500;
theta = 0.5;
elesol = 300 * ones(18, 1);
eleosol = 300 * ones(18, 1);
T(:, 1) = 300 * ones(18, 1);
timInt_m = 1;
firststep = 1;

nodes = [0,0; b/3,0; 2*b/3,0; b,0;
    0,h/3; b/3,h/3; 2*b/3,h/3; b,h/3;
    0,2*h/3; b/3,2*h/3; 2*b/3,2*h/3; b-r*sin(pi/6),h-r*cos(pi/6);
    b,h-r; b-r*cos(pi/6),h-r*sin(pi/6); 0,h;
    b/3,h; b/2,h; b-r,h];

elements = [1,2,6,5; 2,3,7,6; 3,4,8,7; 5,6,10,9; 6,7,11,10;
    7,12,14,11; 7,8,13,12; 9,10,16,15; 10,11,17,16; 11,14,18,17];

dbc=[1,600; 2,600; 3,600; 4,600;
    12,300; 13,300; 14,300; 18,300];

for i = 1:length(t) - 1 % 按照时间的流逝来做循环，来求出一段时间后的温度
    sysmat = zeros(18, 18);
    rhs = zeros(18, 1);
    for n = 1:size(elements, 1)
        [elemat, elevec] = evaluate_instat(nodes(elements(n, :),:), gx2dref(2), gw2dref(2), elesol(elements(n, :)), eleosol, timInt_m, timestep, theta, firststep);
        [sysmat, rhs] = assemble(elemat, elevec, sysmat, rhs, elements(n, :));
    end
    [sysmat, rhs] = assignDBC(sysmat, rhs, dbc);
    T(:, i+1) = sysmat\rhs;
    elesol = T(:, i+1);
end
quadplot(nodes,elements,T(:,length(t)))
shading interp; grid on
colormap(hot);
colorbar
T(:, 11)