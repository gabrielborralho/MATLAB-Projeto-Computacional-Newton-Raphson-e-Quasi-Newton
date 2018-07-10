function [J] = jacobian(x)
%Retorna o Jacobino do Sistema Tridiagonal de Broyden
%Escolhido como Sistema Teste

n = length(x); %Definição da ordem do Jacobiano
if(n == 1)
    disp('O Jacobiano do sistema teste não está definido para ordem unitária!');
return
end
J = zeros(n); %Alocação de memória para o Jacobiano

J(1,1) = 3-x(1); J(1,2) = -2; %Definição da primeira linha do Jacobiano

%Definição da i-ésima linha do Jacobiano para i $\in$ \{2,..n-1\}
for i=2:n-1
    J(i,i-1) = -1;
    J(i,i) = 3-x(i);
    J(i,i+1) = -2;
end

J(n,n-1) = -1; J(n,n) = 3-x(n); %Definição da última linha do Jacobiano

%Return
end