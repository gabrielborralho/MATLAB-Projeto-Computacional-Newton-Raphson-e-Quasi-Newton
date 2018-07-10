function [ A ] = sub( X, Y )
[m,n]=size(X);
[j,k]=size(Y);

if(m~=j)||(n~=k)
    error('Dimensões de Matrizes Incompatíveis');
end

A=zeros(m,n);

for a=1:m
for b=1:n
A(a,b)=X(a,b)-Y(a,b);
end
end
end