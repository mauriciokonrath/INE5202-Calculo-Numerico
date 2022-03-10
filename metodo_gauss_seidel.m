A = [1, 1;
     1, -1];
b = [4, 2]';
n=size(A,1);

x = [0 0 0]';
disp([x',norm(A*x-b)])
for k=2:10
  x0=x;
  for i=1:n
    x(i) = (b(i) - A(i,[1:i-1,i+1:n])*x0([1:i-1,i+1:n]))/A(i,i);
  endfor
  disp([x',norm(A*x-b)])
endfor