clc;
clear;

%% 1.2.1 创建一个1000个0到1数所构成的随机向量

a = rand(1, 1000);
disp(a)

%% 1.2.2 判断a的第一个数是大于0.5还是小于0.5

if a(1) >= 0.5
    disp('a1 >= 0.5')
else
    disp('a1 < 0.5')
end

%% 1.2.3 给出ai大于0.5的数目

m = numel(a(a >= 0.5));
disp(m)

%% 1.2.4 找出ai小于0.499大于0.501的数和index，如果不存在就说没有

total = 0;
for index = 1:1000
    if (a(index) <= 0.501) && (a(index) >= 0.499)
        disp(['index: ' , num2str(index) , ' and ' , 'wert ' , num2str(a(index))])
    else
        total = total + 1;
    end
end

if total == 1000
    disp('Kein Element 0.499 <= a_i <= 0.501')
end

%% 1.2.6 测试n=0和n=5的斐波拉契数列

y_1 = facultaet(0);
y_2 = facultaet(5);
disp(y_1)
disp(y_2)








