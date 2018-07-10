# MATLAB: Projeto Computacional

Neste repositório temos o desenvolvimento do Projeto Computacional: Solução de Sistemas Não-Lineares via Métodos de Newton-Raphson e Quasi-Newton Usando o MATLAB.

A descrição completa e as etapas são descritas no arquivo `Projeto Computacional.pdf`. 

O código fonte deste arquivo em LaTex pode ser acessado em:
https://mega.nz/#F!fUUnRCKK!qFp6WKP-Snmg1KspTl_8YA

# Resumo

Este projeto tem como objetivo o desenvolvimento de um programa computacional para solução de sistemas de equações não-lineares através dos Métodos de Newton-Raphson e Quasi-Newton. O principal pré-requisito para a implementação do Método de Newton-Raphson e suas variantes é a existência de funções (sub-rotinas) para a solução de sistemas de equações lineares. Desta forma, também serão implementados dois métodos para a solução de sistemas lineares: eliminação de Gauss (usada no Método de NewtonRaphson) e Método de Gauss-LU (usada no método Quasi-Newton). Ambos os métodos de solução de sistemas lineares foram implementados com a estratégia de pivoteamento parcial. O método Quasi-Newton que foi utilizado foi o Método de Newton Modificado(Quasi-Newton). Neste método não há atualização da matriz jacobiana durante o processo iterativo, isto é, a matriz jacobiana associada com a estimativa x(0) é usada durante todo o processo iterativo.

# Metodologia

> O programa foi dividido em funções. Por exemplo, foram criadas funções para realizar as seguintes tarefas: 

    - construção da matriz jacobiana;
    
    - cálculo do vetor associado com as equações não lineares (F(x));
    
    - cálculo de ||F(x)||∞; etc.
    
> Foram construidas funções separadas para a solução dos sistemas lineares.

> Foi definida uma função principal `main.m` a partir da qual as funções de solução dos sistemas de equações não-lineares foram chamadas.

# Conclusões

A aprendizagem e o domínio dos métodos de Newton-Raphson e Quasi-Newtonsão de grande importância para determinar com eficiência a resolução de problemas que envolvam a solução de sistemas não lineares. O método de Newton-Raphson apresenta convergência do processo iterativo mais rápida. Isso o torna mais vantajoso em relaçãoaos métodos anteriormente estudados. O método de Newton modificado tem a vantagemde calcular uma única vez a matriz Jacobiana. No caso de resolver por fatoração LU, os fatores L e U serão calculados uma única vez. Esse método se mostrou ineficaz parasistemas com `p≥10`. Por isso foi implementado o método de Quasi-Newton propostopor Broyden. É importante destacar que a ferramenta MATLAB foi de grande auxílio na resolução dos problemas propostos porém estes métodos podem ser implementado de forma semelhante em outras linguagens como C++, Julia, Phyton, entre outras. Como o programa foi dividido em funções, a resolução da matriz jacobiana e o cálculo das normas foram feitas de forma satisfatória, bem como o sistema de equações não-lineares testadas no sistema tridiagonal de Broyden. Na grande maioria das resoluções de sistemas não-lineares o método de Quasi-Newton pode assim apresentar um melhor desempenho.
