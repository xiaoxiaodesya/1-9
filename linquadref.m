function val = linquadref(x_i, eta)
val(1, 1) = 1/4 * (1 - x_i) * (1 - eta);
val(2, 1) = 1/4 * (1 + x_i) * (1 - eta);
val(3, 1) = 1/4 * (1 + x_i) * (1 + eta);
val(4, 1) = 1/4 * (1 - x_i) * (1 + eta);
end