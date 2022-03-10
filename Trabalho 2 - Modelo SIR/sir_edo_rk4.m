function [S, I, R] = sir_edo_rk4 (S0, I0, R0, alpha, gamma, h, H)
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
  
  while (t<=H)
    t += h;
    #yk = (alpha*I0*S0-gama*I0)
    
    k1S = ((-1*alpha)*I0*S0);
    k1I = (alpha*I0*S0-gamma*I0);
    k1R = gamma*I0;  
    
    k2S = ((-1*alpha)*(I0+(h*0.5)*k1I)*(S0+(h*0.5)*k1S));
    k2I = (alpha*(I0+(h*0.5)*k1I)*(S0+((h*0.5)*k1S))-gamma*(I0+(h*0.5)*k1I));
    k2R = (gamma*(I0+(h*0.5)*k1I));
    
    k3S = ((-1*alpha)*(I0+(h*0.5)*k2I)*(S0+(h*0.5)*k2S));  
    k3I = (alpha*(I0+(h*0.5)*k2I)*(S0+((h*0.5)*k2S))-gamma*(I0+(h*0.5)*k2I));    
    k3R = (gamma*(I0+(h*0.5)*k2I)); 
    
    
    k4S = ((-1*alpha)*(I0+h*k3I)*(S0+(h)*k3S)); 
    k4I = (alpha*(I0+h*k3I)*(S0+h*k3S)-gamma*(I0+h*k3I));
    k4R = (gamma*(I0+h*k3I));
    
    S = S0 + (h* 1/6 * (k1S + 2.0 * k2S + 2.0 * k3S + k4S));
    I = I0 + (h* 1/6 * (k1I + 2.0 * k2I + 2.0 * k3I + k4I));
    R = R0 + (h* 1/6 * (k1R + 2.0 * k2R + 2.0 * k3R + k4R));
    
    I0 = I;
    S0 = S;
    R0 = R;

    

    vetorS = [vetorS , S];    
    vetorI = [vetorI , I];
    vetorR = [vetorR , R];

  endwhile 
  
  S = vetorS;
  I = vetorI;
  R = vetorR;
  
endfunction