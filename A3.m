clear;
clc;

%%
f = [0.0, 1.0, 3.0, 1.0];

x_i_1 = 0;
eta_1 = 0;
x_i_2 = 0.577;
eta_2 = -0.577;

val_1 = linquadref(x_i_1, eta_1);
val_2 = linquadref(x_i_2, eta_2);

deriv_1 = linquadderiref(x_i_1, eta_1);
deriv_2 = linquadderiref(x_i_2, eta_2);

%% 3.2 Fkt.I

f_L_1 = f * val_1;
f_L_2 = f * val_2;

%% 3.4 Fkt.II


df_L_1 = f * deriv_1;
df_L_2 = f * deriv_2;
