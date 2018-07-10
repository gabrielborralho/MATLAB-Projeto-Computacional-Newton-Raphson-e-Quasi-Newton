
%Decomposição LU através de pivotamento parcial com retorno de coeficientes
%em esquema de armazenamento compacto e esquema de permutação

function [A,P] = lugauss_fac(A)

n = length(A);
P = zeros(n,1); % Guarda as permutações do pivotamento parcial

for i = 1:n
    P(i) = i;
end

tol_piv = sqrt(eps); % Pivo deve ser maior que a raiz quadrada do menor
%número interpretado como não nulo pelo PC.

for k = 1:(n-1)
    pv = abs(A(k,k));
    r = k; % Guarda a linha do pivo;
fori = (k+1):n
if(abs(A(i,k))>pv)
pv = abs(A(i,k)); % Bloco que define o pivô
r = i;
end
end

if(pv<= tol_piv)
fprintf('\n A matriz é singular!');
        fprintf('\n Parando...');
return
else
if (r~=k)
aux = P(k);
            P(k) = P(r);
            P(r) = aux;
for j = 1:n
                aux = A(k,j);
                A(k,j) = A(r,j); % Permuta as linhas r e j
A(r,j) = aux;
end
end
end
fori = (k+1):n
mik = (A(i,k))/A(k,k);
A(i,k) = mik; %Coeficientes da matriz L
for j = (k+1):n
            A(i,j) = A(i,j)-mik*A(k,j);
end
end
