function retval = bipart_func (a, b, func, stop_error)
  x = (a+b)/2;
  err = (b-a);
  while (err > stop_error)
    if (func(a) * func(x) < 0)
      b = x
    else
      a = x     
    end
    x = (a+b)/2;
    err = b-a;
   
  end
  retval = x;

endfunction
