function [y] = facultaet(n)
y = 1;
if n == 0
    y = 1;
else
    for i = 1:n
        y = y * i;
    end
end
end