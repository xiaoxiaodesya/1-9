function deriv = linquadderiref(x_i, eta)
deriv(1, 1) = -1/4 * (1 - eta);
deriv(1, 2) = -1/4 * (1 - x_i);
deriv(2, 1) = 1/4 * (1 - eta);
deriv(2, 2) = -1/4 * (1 + x_i);
deriv(3, 1) = 1/4 * (1 + eta);
deriv(3, 2) = 1/4 * (1 + x_i);
deriv(4, 1) = -1/4 * (1 + eta);
deriv(4, 2) = 1/4 * (1 - x_i);
end