function [elemat, elevec] = evaluate_stat(elenodes, gpx, gpw)
s = size(gpw);
elemat = zeros(4, 4);
lamda = 48.0;
for i = 1:4
    for j = 1:4
        result = 0;
        for k = 1:s
            xi = gpx(k, 1);
            eta = gpx(k, 2);
            [J, detJ, invJ] = getJacobian(elenodes, xi, eta);
            N = linquadderivref(xi, eta);
            Ni = N(i, :) * invJ;
            Nj = N(j, :) * invJ;
            result = result + lamda * dot(Ni, Nj) * detJ * gpw(k);
        end
        elemat(i, j) = result;
    end
end
elevec = zeros(4,1);
end