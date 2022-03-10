function res = gauss_siedel_3 (x1n, x2n, x3n, epsi, meth)
# Função exemplo para obtenção da solução de 
# um sistema de equações lineares com três incógnitas
# Para a função devem ser passados os valores iniciais
# das incógnitas, valor da tolerância ou precisão e
# o método 0 para Jacobi e 1 para Gauss-Siedel
# Professor Dester
epsin=epsi+1; # Variável auxiliar para testas espsilon
i = 0; # Inicializa contador de iterações
if meth > 0
  printf("\nMétodo de Gauss-Siedel");
  printf("\n======================\n\n");
else
  printf("\nMétodo de Jacobi (Gauss)");
  printf("\n========================\n\n");
endif
   
while (epsin >= epsi) # Verificação da convergência
    
# Cálculo e atualização das variáveis a cada iteração
    x1=x1n; x2=x2n; x3=x3n; i = i+1;
    x1n=(7-2*x2-x3)/10;
    if meth > 0
      x2n=(-8-x1n-x3)/5; # Gauss-siedel
      x3n=(6-2*x1n-3*x2n)/10; # Gauss-siedel
    else
      x2n=(-8-x1-x3)/5; # Jacobi
      x3n=(6-2*x1-3*x2)/10; # Jacobi
   endif

    # Cálculo da "distância" entre as iterações
    if x1 == 0; x1 = 1e-20; endif
    if x2 == 0; x2 = 1e-20; endif
    if x3 == 0; x3 = 1e-20; endif
    epsin = max([abs((x1n-x1)/x1) abs((x2n-x2)/x2) abs((x3n-x3)/x3)]);
    # epsin = abs(norm([x1n x2n x3n]) - norm([x1 x2 x3]))
    
    # Apresenta resultado da iteração
    printf("Iteração = %.0f\n", i);
    printf("x1 = %.6f  x2 = %.6f  x3 = %.6f\n", x1n,x2n,x3n);
    printf("d1 = %.6f  d2 = %.6f  d3 = %.6f\n\n", abs((x1n-x1)/x1),...
    abs((x2n-x2)/x2),abs((x3n-x3)/x3));
    
    # Se o número de iterações ultrapassar 50 define-se a 
    # não convergência do processo iterativo
    if i > 50  
	    res = [ NaN NaN NaN ];
	    return
    endif
  end
  res=[x1n x2n x3n];
endfunction
