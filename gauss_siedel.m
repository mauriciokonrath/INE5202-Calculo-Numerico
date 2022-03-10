function res = gauss_siedel_3 (x1n, x2n, x3n, epsi, meth)
# Fun��o exemplo para obten��o da solu��o de 
# um sistema de equa��es lineares com tr�s inc�gnitas
# Para a fun��o devem ser passados os valores iniciais
# das inc�gnitas, valor da toler�ncia ou precis�o e
# o m�todo 0 para Jacobi e 1 para Gauss-Siedel
# Professor Dester
epsin=epsi+1; # Vari�vel auxiliar para testas espsilon
i = 0; # Inicializa contador de itera��es
if meth > 0
  printf("\nM�todo de Gauss-Siedel");
  printf("\n======================\n\n");
else
  printf("\nM�todo de Jacobi (Gauss)");
  printf("\n========================\n\n");
endif
   
while (epsin >= epsi) # Verifica��o da converg�ncia
    
# C�lculo e atualiza��o das vari�veis a cada itera��o
    x1=x1n; x2=x2n; x3=x3n; i = i+1;
    x1n=(7-2*x2-x3)/10;
    if meth > 0
      x2n=(-8-x1n-x3)/5; # Gauss-siedel
      x3n=(6-2*x1n-3*x2n)/10; # Gauss-siedel
    else
      x2n=(-8-x1-x3)/5; # Jacobi
      x3n=(6-2*x1-3*x2)/10; # Jacobi
   endif

    # C�lculo da "dist�ncia" entre as itera��es
    if x1 == 0; x1 = 1e-20; endif
    if x2 == 0; x2 = 1e-20; endif
    if x3 == 0; x3 = 1e-20; endif
    epsin = max([abs((x1n-x1)/x1) abs((x2n-x2)/x2) abs((x3n-x3)/x3)]);
    # epsin = abs(norm([x1n x2n x3n]) - norm([x1 x2 x3]))
    
    # Apresenta resultado da itera��o
    printf("Itera��o = %.0f\n", i);
    printf("x1 = %.6f  x2 = %.6f  x3 = %.6f\n", x1n,x2n,x3n);
    printf("d1 = %.6f  d2 = %.6f  d3 = %.6f\n\n", abs((x1n-x1)/x1),...
    abs((x2n-x2)/x2),abs((x3n-x3)/x3));
    
    # Se o n�mero de itera��es ultrapassar 50 define-se a 
    # n�o converg�ncia do processo iterativo
    if i > 50  
	    res = [ NaN NaN NaN ];
	    return
    endif
  end
  res=[x1n x2n x3n];
endfunction
