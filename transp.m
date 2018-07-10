
function [ b ] = transp(v)
[m,n]=size(v);
b=zeros(n,m);

for i=1:n
for j=1:m
b(i,j)=v(j,i);
end
end
end
