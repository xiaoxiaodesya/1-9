function gaussx = gx2dref(n)
if n == 1
    gaussx = [0, 0];
elseif n == 2
    gaussx = [-1/sqrt(3), -1/sqrt(3); -1/sqrt(3), 1/sqrt(3); 1/sqrt(3), -1/sqrt(3); 1/sqrt(3), 1/sqrt(3)];
elseif n == 3
    k = sqrt(3/5);
    gaussx = [-k, -k; -k, 0; -k, k; 0, -k; 0, 0; 0, k; k, -k; k, 0; k, k];
else
    disp('false n')
end