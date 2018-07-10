function [x,norm_res,iter] = newton_raphson(system,jacobian,x0,tol,iter_max)

%Descrição da função: retorna a solução de um sistema não-linear F(x)=0
%utilizando o método de Newton-Raphson 

%Entrada: 
% system: handle para o sistema base a ser resolvido F(x)=0
% jacobian: handle para o jacobiano do sistema base 
% x0: estimativa inicial de solução
% tol: tolerância esperada, medida através da norma infinita do vetor F de resíduos
% iter_max: número máximo de iterações que podem ser realizadas pela função

%Saída:
% x: solução do sistema 
% norm_res: norma do vetor de resíduos
% iter: número de iterações realizadas

n = length(x0);
x = x0;
iter = 0;
res = feval(system,x);
norm_res = norm_inf(res); 

while(iter<iter_max&&norm_res>tol)
J = feval(jacobian,x);
    [A,P] = lugauss_fac(J);%Fatora o jacobiano em LU com pivotamento parcial em armazenamento compacto
    dx = lugauss_sol(A,P,-res);
    x = sum_mat(x,dx);
res = feval(system,x);
norm_res = norm_inf(res);
iter = iter+1;    
end