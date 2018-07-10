function [x,k, n]=quasi2(x, tol, ninter_max)
% O metodo da secante tem por finalidade encontrar
% a solucao do sistema nao linear de equacoes da
% forma F(x)=0

%o numero de iteracoes inicia com valor zero
k=0;
%atribuicao de valor zero a variavel de controle
control=0;
%Bk recebe o valor da jacobiana de F(x) em x
B=jacobian(x);
[B,P] = lugauss_fac(B);
%especificando quando o loop finaliza
while (control==0)&&(k<=ninter_max)
%determinando o valor de F(x) no ponto x em questao
f=broyden(x);
%Bks=-f;
s = lugauss_sol(B,P,-f);
%armazenando o valor de x_k
 a=transp(s);
 xp=sum_mat(x,a); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% soma(x,a) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%determinando o valor de F(x) no ponto xp
 f2=broyden(xp);
%a variavel y recebe a diferenca de F(xp)-F(x)
 y=sub(f2, f);
%atualizacao da matriz Bk
%B=B+((y-B*s)*a)/(a*s)
 dum1=mult(B, s);
 dum2=sub(y, dum1);
 dum3=mult(dum2, a);
 dum4=mult(a,s);
 dum=dum3/dum4;
 B=sum_mat(B, dum);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% soma(B,dum) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

%testando a variavel de controle
if norm_inf(xp-x)<=tol
control=1;
end
 n = norm_inf(xp-x);
%atualizando x
 x=xp;
%atualizando o numero de iteracoes
 k=k+1;
end