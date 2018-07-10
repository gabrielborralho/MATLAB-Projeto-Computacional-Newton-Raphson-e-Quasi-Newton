clc
clear all

%% Script base para execução dos testes e comparações do sistema de Broyden resolvido por Newton-Raphson e pela função fsolve do MATLAB
p=input('Digite a ordem do sistema: ');%Leitura da ordem do sistema de Broyden definido pelo usuário;
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

%% Mede o tempo utilizado pelo método de Newton-Raphson 
aux = cputime;
[x_nr,norm_res,iter] = newton_raphson(@broyden,@jacobian_broyden,x0,tol,iter_max);
time_newtonraphson = cputime-aux;

%% Mede o tempo utilizado pelo fsolve
aux = cputime;
[x_fs] = fsolve(@broyden,x0);
time_fsolve = cputime-aux;

%% Compara a solução encontrada pelo fsolve e o método de Newton-Raphson
[x_nr,x_fs]

