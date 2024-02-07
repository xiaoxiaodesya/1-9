clc;
clear;

%%  Mehrdimensionale Gauß-Quadratur

n = input('n = ');
gaussx = gx2dref(n);
gaussw = gw2dref(n);
s = 0;
nodes = [2, 1; 4, 1; 4, 3; 2, 2];

if n == 1
    for i = 1:n*n
        [J, det_J, inv_J] = getJacobian(nodes, gaussx(1, 1), gaussx(1, 2));
        N1 = 1/4*(1-gaussx(1,1))*(1-gaussx(1,2));
        N2 = 1/4*(1+gaussx(1,1))*(1-gaussx(1,2));
        s = N1*N2*det_J*gaussw;
    end

elseif (n == 2)
    for i = 1:n*n
        [J, det_J, inv_J] = getJacobian(nodes, gaussx(i, 1), gaussx(i, 2));
        N1=1/4*(1-gaussx(i,1))*(1-gaussx(i,2));
        N2=1/4*(1+gaussx(i,1))*(1-gaussx(i,2));
        s= s + N1*N2*det_J*gaussw(i);
    end

elseif n==3
    for i=1:n*n
        [J,det_J,invJ] = getJacobian([2, 1; 4, 1; 4, 3; 2, 2], gaussx(i,1), gaussx(i,2));
        N1=1/4*(1-gaussx(i,1))*(1-gaussx(i,2));
        N2=1/4*(1+gaussx(i,1))*(1-gaussx(i,2));
        s=s + N1*N2*det_J*gaussw(i);
    end
end
display(s)