clc;
clear

%% 1. evaluate_stat function 

elenodes = [0, 0; 1, 0; 1, 2; 0, 2];
gpx = gx2dref(3);
gpw = gw2dref(3);

[elemat, elevec] = evaluate_stat(elenodes, gpx, gpw);

%% 2. assemble function

new_elemat = [1,2,3,4;5,6,7,8;9,10,11,12;13,14,15,16];
new_elevec = [17;18;19;20];
sysmat = eye(5, 5);
rhs = ones(5, 1);
ele = [5, 3, 1, 2];
[sysmat, rhs] = assemble(new_elemat, new_elevec, sysmat, rhs, ele);

%% 3. assignDBC function

% sysmat = [12, 12, 10, 0, 9; 15, 17, 14, 0, 13; 7, 8, 7, 0, 5; 0, 0, 0, 1, 0; 3, 4, 2, 0, 2];
% rhs = [20; 21; 19, 1; 18];
dbc = [2, -7; 5, -2];
[dbcsysmat, dbcrhs] = assignDBC(sysmat, rhs, dbc);