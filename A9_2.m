tic;
clear;
r = 0.02;
b = 0.3;
h = 0.3;

nodes = [0,0; b/3,0; 2*b/3,0; b,0;
    0,h/3; b/3,h/3; 2*b/3,h/3; b,h/3;
    0,2*h/3; b/3,2*h/3; 2*b/3,2*h/3; b-r*sin(pi/6),h-r*cos(pi/6);
    b,h-r; b-r*cos(pi/6),h-r*sin(pi/6); 0,h;
    b/3,h; b/2,h; b-r,h];

elements = [1,2,6,5; 2,3,7,6; 3,4,8,7; 5,6,10,9; 6,7,11,10;
    7,12,14,11; 7,8,13,12; 9,10,16,15; 10,11,17,16; 11,14,18,17];

dbc=[1,600; 2,600; 3,600; 4,600;
    12,300; 13,300; 14,300; 18,300];

sysmat = zeros(18, 18);
rhs = zeros(18, 1);

for n = 1:size(elements, 1)
    % 这里的elements(n, :)就是求的是不同的行
    [elemat, elevec] = evaluate_stat(nodes(elements(n, :), :), gx2dref(2), gw2dref(2));
    [sysmat, rhs] = assemble(elemat, elevec, sysmat, rhs, elements(n, :));
end

[sysmat, rhs] = assignDBC(sysmat, rhs, dbc);
k = [];

tic;
T = sysmat\rhs;
k(1) = toc;

tic
T = solveGauss(sysmat, rhs);
k(2) = toc;

tic
T = solveG(sysmat, rhs, zeros(size(rhs)), 1e-7, 1000);
k(3) = toc;

tic
T = solveCG(sysmat, rhs, zeros(size(rhs)), 1e-7, 1000);
k(4) = toc;

toc




