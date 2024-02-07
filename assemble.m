function [sysmat, rhs] = assemble(elemat, elevec, sysmat, rhs, ele)
a = zeros(size(sysmat));
b = zeros(size(rhs));
for i = 1:4
    for j = 1:4
        a(ele(i), ele(j)) = elemat(i, j);
    end
    b(ele(i)) = elevec(i);
end
sysmat = sysmat + a;
rhs = rhs + b;
end