clc
clear all

p=input('Digite a ordem do sistema: ');
x0=-ones(1, p); %Define a solução inicial;
tol = 1e-6; % Define a tolerência (norma infinita do vetor de resíduos)
inter_max = 800; %Define o número máximo de iterações realizadas pelo método de Quasi-Newton
time_fsolve = 0; %Contém o tempo de processamento para solução do sistema com fsolve
time_quasinewton = 0; %Conterá o tempo de processamento para solução do sistema com Quasi-Newton
aux = 0; %variável auxiliar;

clc

aux = cputime;
[x_qn,iter, n] = quasi2(x0, tol, inter_max);
time_quasinewton = cputime-aux;

aux = cputime;
[x_fs] = fsolve(@broyden,x0);
time_fsolve = cputime-aux;