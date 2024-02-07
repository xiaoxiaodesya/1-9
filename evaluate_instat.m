function [elemat, elevec] = evaluate_instat(elenodes, gpx, gpw, elesol, eleosol, timInt_m, timestep, theta, firststep)
elemat = zeros(4, 4);
lamda = 48.0;
p = 7800;
c = 452;
M = zeros(4, 4);
B = zeros(4, 4);
for i = 1:4
    for j = 1:4
        s1 = 0;
        s2 = 0;
        for k = 1:size(gpw)
            xi = gpx(k, 1);
            eta = gpx(k, 2);
            val = linquadref(xi, eta);
            deriv = linquadderivref(xi, eta);
            [J, detJ, invJ] = getJacobian(elenodes, xi, eta);
            Ni = val(i, :);
            Nj = val(j, :);
            gNi = deriv(i, :) * invJ;
            gNj = deriv(j, :) * invJ;
            s1 = s1 + p * c * Ni * Nj * detJ * gpw(k); %这里是标量，直接乘就行
            s2 = s2 + lamda * dot(gNi, gNj) * detJ * gpw(k);
        end
        M(i, j) = s1;
        B(i, j) = -s2;
    end
end
C = [0, 0, 0];
if timInt_m == 1
    [LHS, RHS] = OST(theta, timestep, M, B, C, elesol);
elseif timInt_m == 2
    [LHS, RHS] = AB2(timestep, M, B, C, [elesol, eleosol]);
elseif timInt_m == 3
    [LHS, RHS] = AM3(timestep, M, B, C, [elesol, eleosol]);
elseif timInt_m == 4
    [LHS, RHS] = BDF2(timestep, M, B, C, [elesol, eleosol]);
else
    disp('false')
end
elemat = LHS;
elevec = RHS(:, 1);
end










