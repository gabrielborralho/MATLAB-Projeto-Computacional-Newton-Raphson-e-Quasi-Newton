% Script base para execu��o dos testes e compara��es do sistema de Broyden resolvido por Newton-Raphson e pela fun��o fsolve do MATLAB

p = 1000; %Define a ordem do sistema de Broyden para 1000;
tol = 1e-6; % Define a toler�ncia (norma infinita do vetor de res�duos)
iter_max = 800; %Define o n�mero m�ximo de itera��es realizadas pelo m�todo de Newton-Raphson
time_fsolve = 0; %Conter� o tempo de processamento para solu��o do sistema com fsolve
time_newtonraphson = 0; %Conter� o tempo de processamento para solu��o do sistema com Newton-Raphson
aux = 0; %vari�vel auxiliar;

%% C�lculo do grau e padr�o de esparsidade da matriz para p 
x0 = -ones(p,1);
spy(jacobian_broyden(x0),'+');
title('Padr�o de Esparsidade do Jacobiano')
sparsity_degree = ((p^2-3*p+2)/p^2)*100;

aux = cputime;
[x_nr,norm_res,iter] = newton_raphson(@broyden,@jacobian_broyden,x0,tol,iter_max);
time_newtonraphson = cputime-aux;

aux = cputime;
[x_fs] = fsolve(@broyden,x0);
time_fsolve = cputime-aux;

[x_nrx_fs]
