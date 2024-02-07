function wert_dbasis = LagrangeDerivBasis(x, n, i, x_node)
for index = 1:i
    w_1 = 0;
    for m = 1:n+1
        if m ~= index
            w_2 = 1;
            for k = 1:n+1
                if k ~= index && k ~= m
                    w_2 = w_2 * (x - x_node(k)) / (x_node(index) - x_node(k));
                end
            end
            w_1 = w_1 + 1 / (x_node(index) - x_node(m)) * w_2;
        end
    end
    wert_dbasis(index) = w_1;
end
end