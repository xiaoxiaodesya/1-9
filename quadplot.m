function quadplot(nodes,elements,sol)
zeile=size(elements,1);
x=nodes(:,1);
y=nodes(:,2);
z=sol;
T=zeros(2*zeile,3);
for i=1:size(elements,1)
 T(2*i-1,:)=[elements(i,1:2),elements(i,4)];
 T(2*i,:)=[elements(i,2:4)];
end
% T=[1 2 5
%    5 4 1
%    2 3 6
%    6 5 2
%    4 5 8
%    4 8 7
%    5 6 9
%    5 8 9]
trisurf(T,x,y,z)
xlabel('x'),ylabel('y'),zlabel('f(x,y)')
end
% [x,y] = meshgrid(-1:1,-1:1);
% z = x.*x+y.*y;
% T = delaunay(x,y);
% subplot(1,2,1),trisurf(T,x,y,z)
% subplot(1,2,2),mesh(x,y,z)

