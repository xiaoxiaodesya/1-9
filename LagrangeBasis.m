function wert_basis = LagrangeBasis(x, n, i, x_node)
for index = 1:i
    w = 1;
    for k = 1:n+1
        if k ~= index
            w = w * (x - x_node(k)) / (x_node(index) - x_node(k));
        end
    end
    wert_basis(index) = w;
end
end

%为什么要用w代替wert_basis,因为w=一个值，这个变量不需要声明，但是w=w*w时第一个w不声明系统无法识别第一个w。
%            wert_basis(j)=wert_basis(j)*(x-x_node(k))/(x_node(j)-x_node(k));