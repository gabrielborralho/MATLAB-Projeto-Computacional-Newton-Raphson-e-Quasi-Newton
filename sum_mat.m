% Função que soma duas matrizes

function C = sum_mat(A,B);
[M,N] = size(A);
[O,P] = size(B);

if(N~=P || M ~=O)
error('As matrizes não podem ser somadas! Dimensões incompatíveis');    
else
    C = zeros(M,N);
for i=1:M
for j=1:N
            C(i,j)=A(i,j)+B(i,j);
end
end
end