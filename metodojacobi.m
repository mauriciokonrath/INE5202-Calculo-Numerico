function [x, Dr] = metodojacobi(A,b,x0,kmax,tau);
  D = diag(diag(A));
  M = A-D;
  k = 1; Dr(k) = tau+1;
  while (k<=kmax) & (Dr(k) >tau);
    k = k+1;
    x = D \ (b-M*x0);
    Dr(k) = norm(x-x0, inf)/norm(x,inf);
    x0 = x;
  endwhile

