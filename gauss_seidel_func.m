a =[3, -1, -1;
    1, 3, 1;
    1, -1, 2];
b = [1, 5, 2];
x0 = [0,0,0];
Nmax = 1;
x_mat = zeros(size(A, 1), Nmax);
% A=D-L-U
D = diag(diag(A));
L = -tril(A, -1);
U = -triu(A, 1);
T = inv(D) * (L + U);
c = inv(D) * b;

% init 
x_mat(:, 1) = x0;
    
% iteration process
for (i = 1 : Nmax)
  x_mat(:, i+1) = T * x_mat(:, i) + c;
endfor
