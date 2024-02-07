clear;
clc;

%%
elenodes=[0,0;1,0;1,2;0,2];
gpx=gx2dref(3);
gpw=gw2dref(3);
elesol=[1;2;3;4];
eleosol=[0;0;0;0];
timInt_m=1;
timestep=1000;
theta=0.66;
firststep=1;

[elemat, elevec] = evaluate_instat(elenodes, gpx, gpw, elesol, eleosol, timInt_m, timestep, theta, firststep)