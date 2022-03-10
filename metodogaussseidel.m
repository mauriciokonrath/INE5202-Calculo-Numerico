function [x,Dr]= metodogaussseidel(A,b,x0,kmax,tau);
  L = tril(A);
  U = A-L;k = 1; 
  Dr(k) = tau+1;
  while (k<=kmax)&(Dr(k)>tau)
    k = k+1;
    x = L\(b-U*x0);
    Dr(k) = norm(x-x0,inf)/norm(x,inf);
    x0 = x;
  endwhile

  