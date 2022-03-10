function [A, b] = generate_system (n1, n2)
  % This function is used to generate the A and b matrices of a linear system Ax = b
  % n1 and n2 are used as input to the system generation.
  % Return A nd b, respectively.
  
  A(1, 1) = 2; A(1, 2) = -1;
  b(1) = 0.1;
  
  for i=2:n1-1
    A(i, i-1) = -1; A(i, i) = 2; A(i, i+1) = -1;
    b(i) = 0.1;
  endfor
  
  for i=n1:n2-1
    A(i, i-2) = -1; A(i, i-1) = -1; A(i, i) = 2;
    b(i) = 0.2;
  endfor
  
  A(n2, n2-1) = -1; A(n2, n2) = 1;
  b(n2) = 0.3;
endfunction
