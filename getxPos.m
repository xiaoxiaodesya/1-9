function x = getxPos(nodes, x_i, eta)
x = linquadref(x_i, eta)' * nodes;
end