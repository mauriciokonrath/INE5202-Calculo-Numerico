clear
clc
%a = [1 1 1;2 1 -1;3 -4 2];
%b = [1/6 13/6 -10/6];
a = [3 3 1;1 1 1;4 -1 2];
b = [-6 -3 1];
ca=a;
cb=b;
n = length(b);
for k=1:n-1 %linha pivo e coef pivo
  %procurando maior em modulo
  maior=abs(a(k,k));
  p=k;
  for i=k+1:n
    if (abs(a(i,k))>maior)
      maior=abs(a(i,k));
      p=i;%linha do maior em modulo
    end
  end 
  %trocando linhas 
  if(p>k) 
  for j=k:n
    aux=a(k,j);
    a(k,j)=a(p,j);
    a(p,j)=aux;
  end 
  aux=b(k);
  b(k)=b(p);
  b(p)=aux;
end

a
b
 
  for i=k+1:n
    mult=a(i,k)/a(k,k);
    for j=k:n
      a(i,j)=a(i,j)-mult*a(k,j);
    end
    b(i)=b(i)-mult*b(k);
end
end
a
b
% --------- retrosubstituicao -----
x(n)=b(n)/a(n,n);
for i=n-1:-1:1
  soma=0;
  for j=i+1:n
  soma=soma+a(i,j)*x(j);
end
x(i)=(b(i)-soma)/a(i,i);
end
x
%---residuo---
r=abs(cb' -ca*x')