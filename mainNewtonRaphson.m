% Script base para execução dos testes e comparações do sistema de Broyden resolvido por Newton-Raphson e pela função fsolve do MATLAB

p = 1000; %Define a ordem do sistema de Broyden para 1000;
tol = 1e-6; % Define a tolerência (norma infinita do vetor de resíduos)
iter_max = 800; %Define o número máximo de iterações realizadas pelo método de Newton-Raphson
time_fsolve = 0; %Conterá o tempo de processamento para solução do sistema com fsolve
time_newtonraphson = 0; %Conterá o tempo de processamento para solução do sistema com Newton-Raphson
aux = 0; %variável auxiliar;

%% Cálculo do grau e padrão de esparsidade da matriz para p 
x0 = -ones(p,1);
spy(jacobian_broyden(x0),'+');
title('Padrão de Esparsidade do Jacobiano')
sparsity_degree = ((p^2-3*p+2)/p^2)*100;

aux = cputime;
[x_nr,norm_res,iter] = newton_raphson(@broyden,@jacobian_broyden,x0,tol,iter_max);
time_newtonraphson = cputime-aux;

aux = cputime;
[x_fs] = fsolve(@broyden,x0);
time_fsolve = cputime-aux;

[x_nrx_fs]
