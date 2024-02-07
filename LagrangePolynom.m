function wert_poly = LagrangePolynom(x, n, x_node, f_node, wert_basis)
wert_poly = sum(wert_basis .* f_node);
end