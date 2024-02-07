clc;
clear;

%%
P_1(1) = 0;
P_2(1) = 0;
P_3(1) = 0;
timestep = 0.2;
M = 1;
B_1 = [-6, -6];
B_2 = [-6, -6, -6];
B_3 = [-6];
t = 0:0.2:2;
C = t .^ 2 .* exp(-5 .* t);
n = 0;

for i = 1:2/timestep
    P_1(i + 1) = P_1(i) + timestep * (n .^ 2 .* exp(-5 .* n) - 6 * P_1(i));
    P_2(i + 1) = (P_2(i) + timestep * ((n + 0.1) .^ 2 .* exp(-5 .* (n + 0.1)))) ./ (1 + timestep * 6);
    P_3(i + 1) = (P_3(i) + 1/2 * timestep * (((n + 0.1) .^ 2 .* exp(-5 .* (n + 0.1)) + n .^ 2 .* exp(-5 .* n) - 6 * P_3(i)))) / (1 + 1/2 * timestep * 6);
    n = n + 0.1;
end

sol_1 = [1.9722e-04 0];
P_4 = [0  1.9722e-04];
for i=1:2/timestep-1
    [L R]=AB2(timestep,M,B_1,[C(i+1),C(i)],sol_1);   
    P_4(i+2) = R/L;
    sol_1 = [P_4(i+2) P_4(i+1)];     
end

sol_2 = [1.9722e-04 0];
P_5=[0 1.9722e-04];
for i=1:2/timestep-1
    [L5 R5] = AM3(timestep,M,B_2,[C(i+2),C(i+1),C(i)],sol_2);   
    P_5(i+2) = R5/L5;
    sol_2 = [P_5(i+2) P_5(i+1)];     
end

sol_3 = [1.9722e-04 0];
P_6 = [0 1.9722e-04];
for i = 1:2/timestep-1
    [L6 R6] = BDF2(timestep, M, B_3, [C(i+2)],sol_3);   
    P_6(i+2) = R6/L6;
    sol_3 = [P_6(i+2) P_6(i+1)];     
end

P=exp(-5*t).*(t.*t-2*t+2)-2*exp(-6*t); 

plot(t,P,'k--','LineWidth',2),hold on
plot(t,P_1),hold on
plot(t,P_2),hold on
plot(t,P_3),hold on
plot(t,P_4),hold on
plot(t,P_5),hold on
plot(t,P_6),grid on
axis([0 2 0 4*10^-3])
xlabel('t'),ylabel('Phi')
title('timestep=0.1')
%axis([10^-5,1,10^-20,10^10])
legend({'exakt','Euler Expl.','Euler Impl','Trapez','AB2','AM3','BDF2'},'Location','northeast')