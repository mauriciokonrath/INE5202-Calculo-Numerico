function [S, I, R] = sir_edo_rk2 (S0, I0, R0, alpha, gamma, h, H)
  # S0: Initial number of susceptibles.
  # I0: Initial number of infected.
  # R0: Initial number of recovered.
  # alpha: infectious rate.
  # gamma: recovery rate.
  # h: discretization step.
  # H: end of the time interval.
 
  t = 0;
  vetorS = [];
  vetorI = [];
  vetorR = [];
  
#K2 = f(xk + h, yk + hK1)
#yk+1 = yk + h/2 (K1 + K2) 

  while (t<=H)
    t+= h;
    
    k1S = (-1*alpha)*I0*S0;
    k1I = (alpha*I0*S0)-(gamma*I0);
    k1R = gamma*I0;
 
 
    k2S = -1*alpha*(I0+h*k1I)*(S0+h*k1S);    
    k2I = alpha*(I0+h*k1I)*(S0+h*k1S)-gamma*(I0+h*k1I);       
    k2R = gamma*(I0+h*k1I);

    S = S0+(h/2)*(k1S + k2S);
    I = I0+(h/2)*(k1I + k2I);
    R = R0+(h/2)*(k1R + k2R);   
    
    

    I0 = I;
    S0 = S;
    R0 = R;
    
    vetorS = [vetorS , S0];    
    vetorI = [vetorI , I0];
    vetorR = [vetorR , R0];

  endwhile 
  S = vetorS;
  I = vetorI;
  R = vetorR;
endfunction
