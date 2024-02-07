function [J, det_J, inv_J] = getJacobian(nodes, x_i, eta)
d_J = linquadderivref(x_i, eta)' * nodes;
J = d_J';
det_J = det(J);
inv_J = inv(J);
end