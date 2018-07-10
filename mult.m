function [ A ] = mult( X, Y )
[m,n]=size(X);
[j,k]=size(Y);

if(n~=j)
    error('Dimensões de Matrizes Incompatíveis');
end

A=zeros(m,k);
for a=1:m
for b=1:k
for v=1:j
        A(a,b)=A(a,b)+(X(a,v)*Y(v,b));
end

end
end
end
