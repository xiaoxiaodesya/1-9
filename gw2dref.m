function gaussw = gw2dref(n)
w_1 = 5/9;
w_2 = 8/9;
if n == 1
    gaussw = [4.0];
elseif n == 2
    gaussw = [1.0; 1.0; 1.0; 1.0];
elseif n == 3
    gaussw = [w_1*w_1; w_1*w_2; w_1*w_1; w_1*w_2; w_2*w_2; w_1*w_2; w_1*w_1; w_1*w_2; w_1*w_1];
else
    disp('false n')
end