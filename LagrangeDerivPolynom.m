function wert_dpoly = LagrangeDerivPolynom(x, n, x_node, f_node, wert_dbasis)
wert_dpoly = sum(wert_dbasis .* f_node);
end