function quadplot(nodes, elements, sol)
x = nodes(:,1);
y = nodes(:,2);
zeile = size(elements, 1);
z = sol;
T = zeros(2 * zeile, 3);
for index = 1: 4
    T(2*index-1, :) = [elements(index, 1:3)];
    T(2*index, :) = [elements(index, 3:4), elements(index, 1)];
end
trisurf(T,x,y,z)
end