#Metodo de Crouut com solucao
%Ax = b ==> A = LU
%nesse metodo primeiro acha L e depois U
%"k" vai fixar a coluna de U e fixar as linhas L
clear
clc

a =[1 1 1;
    2 3 1; 
    -2 1/2 1];
b = [-2 -2 0];
%ca = a;
%cb = b;
n = length(b);

for k= 1:n
  %----------------------------
  for i=k:n%aqui o L
    soma = 0;
    for t = 1:k-1
        soma = soma + L(i,t)*U(t,k);
    endfor
    L(i,k) = a(i,k) - soma;
   endfor
   U(k,k) = 1;
 %------------------------------
   for j= k+1:n  %qui o U
    soma = 0;
     for t = 1:k-1
       soma = soma + L(k,t)*U(t,j);
     endfor
     U(k,j) = (a(k,j) - soma) /L(k,k);
   endfor
 %---------------------------------
endfor% fim da parte 1

%------substituicao direta
%------ Ly = b -------------
y(1) = b(1)/L(1,1);
for i=2:n
    soma = 0;
      for j = 1:i-1
        soma = soma + L(i,j)*y(j);
      endfor
       y(i) = (b(i) - soma)/L(i,i);
endfor
%----Ux = y -----------
x(n) = y(n)/  U(n,n);

 for i=n-1:-1:1 %passo de decremento
   soma=0;
    for j=i+1:n
      soma  = soma + U(i,j)*x(j);
    endfor
    x(i) = (y(i) - soma)/U(i,i);
 endfor
det(a)
cond(a)
 L
 U
 x
 y

 %residuo

 r= abs(b' -a*x')