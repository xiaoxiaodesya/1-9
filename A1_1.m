clc;
clear;

A = [3, 3, 3, 3];
A = diag(A); % 直接用diag来表示对角矩阵，然后A里面的数是对角矩阵对角线的值
v = [1; 2; 3; 4];

%% 1.1.1 a = v*v

a = v' * v;
disp(a)

%% 1.1.2 B = v*v'

B = v * v';
disp(B)

%% 1.1.3 C = A * B

C = A * B;
disp(C)

%% 1.1.4 求Matrix C的特征值

lambda = eig(C);
disp(lambda)

%% 1.1.5 求x: (C-A)*x = a*v

x = (C - A) \ (a * v);
disp(x)

%% 1.1.6 将C的第二行换成v

C(:,2) = v;
disp(C)

%% 1.1.7 将C的第三行取名为b

b = C(3,:);
disp(b)

%% 1.1.8 产生一个10到100，步长为0.5的行向量

c = 10.0: 0.5: 100.0;
disp(c)

%% 1.1.9 产生一个行向量f

f = c .* (5 + c) + 1 ./ c + power(2, c);
disp(f)

%% 1.1.10 给出f的维度

n = size(f);
disp(n(2))
