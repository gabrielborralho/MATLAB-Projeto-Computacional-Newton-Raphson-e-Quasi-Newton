function [F] = broyden(x)

n = length(x); %Definição da ordem do sistema tridiagonal de Broyden
if(n == 1)
    disp('O sistema tridiagonal de Broyden não está definido para ordem unitária!');
return
end
F = zeros(n,1); %Alocação de memória 

%Definição do sistema
F(1) = x(1)*(3-.5*x(1))-2*x(2)+1;
for i = 2:n-1
    F(i) = x(i)*(3-.5*x(i))-x(i-1)-2*x(i+1)+1;
end
F(n) = x(n)*(3-.5*x(n))-x(n-1)+1;
end