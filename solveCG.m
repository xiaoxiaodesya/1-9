function [x, k] = solveCG(A, b, x0, rtol, itermax)
k = 0;
x = x0;
r0 = b - A * x0;
p = r0;
r_k = r0;
while norm(r_k, 2) > rtol && k < itermax
    v = A * p;
    alpha = (r_k' * r_k) / (p' * v);
    x = x + alpha * p;
    r_k_1 = r_k - alpha * v;
    belta = (r_k_1' * r_k_1) / (r_k' * r_k);
    p = r_k_1 + belta * p;
    r_k = r_k_1;
    k = k + 1;
end
end