% Função que resolve um sistema linear, dada a matriz de decomposição
% LU compacta A, o vetor de permutações e o vetor de coeficientes b

function [x] = lugauss_sol(A,P,b)

    n = length(b);
    y = zeros(n,1);
    x = zeros(n,1);

    for i = 1:n
        r = P(i);
        c(i) = b(r);
    end

    for i = 1:n
        acum = 0;
        for j = 1:(i-1)
            acum = acum + A(i,j)*y(j);
        end
        y(i) = c(i)-acum;
    end

    for i = n:-1:1
        acum = 0;
        for j = (i+1):n
            acum = acum + A(i,j)*x(j);
        end
        x(i) = (y(i)-acum)/A(i,i);
    end 

    end

