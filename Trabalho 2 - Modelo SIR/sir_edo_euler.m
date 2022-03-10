function [S, I, R] = sir_edo_euler (S0, I0, R0, alpha, gamma, h, H)  
  # S0: Initial number of susceptibles.  
  # I0: Initial number of infected.  
  # R0: Initial number of recovered.  
  # alpha: infectious rate.  
  # gamma: recovery rate.  
  # h: discretization step.  
  # H: end of the time interval.  
  
  St0 = [S0]; 
  It0 = [I0]; 
  Rt0 = [R0]; 
  t = [0];
  k = 1; 
   
   
  while t(k) <= H 
    St0 = [St0 ; St0(k) + h * (-alpha*St0(k)* It0(k))]; 
    It0 = [It0 ; It0(k) + h * ((alpha*St0(k)*It0(k)) - gamma* It0(k))]; 
    Rt0 = [Rt0 ; Rt0(k) + h * (gamma * It0(k))]; 
    t(k) = t(k) + h; 
    t = [t;t(k)] ; 
    k += 1 ; 
    
    S = St0;
    I = It0;
    R = Rt0;
   
     
  endwhile 

 retval = [S,I,R]; 
    
endfunction
