function x = solveGauss(A, b)
[n, ~] = size(A);
x = zeros(n, 1);
for i = 1:n-1
    for j = i+1:n
        mul = A(j, i) / A(i, i);
        A(j, :) = A(j, :) - mul * A(i, :);
        b(j) = b(j) - mul * b(i);
    end
end

for j = n:-1:1
    sum = 0;
    for i = n:-1:j+1
        sum = sum + x(i) * A(j, i);
    end
    x(j) = (b(j) - sum)/A(j, j);
end
end