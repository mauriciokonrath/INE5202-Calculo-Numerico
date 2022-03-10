function retval = get_residuos (x, A, b)
  % This function computes the residuals for the linear system Ax = b
  % retval: a vector with the residuals for each equation.
  n = rows(A);
  for i=1:n
    lhs = dot(x, A(i, 1:end));
    res(i) = abs(lhs - b(i));
  endfor
  retval = res;
endfunction
