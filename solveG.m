function [x, k] = solveG(A, b, x0, rtol, itermax)
x = x0;
k = 0;
r0 = b - A * x0;
r = r0;
while norm(r, 2) > rtol && k < itermax
   v = A * r;
   alpha = (r' * r) / (r' * v);
   x = x + alpha * r;
   r = r - alpha * v;
   k = k + 1;
end
end