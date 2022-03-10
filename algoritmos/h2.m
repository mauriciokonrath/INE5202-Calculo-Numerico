function y= h2(x) 
m=6;
T=[ 0.2    0.4    0.6    0.8   0.9   1.0  ];
V=[ 0.04   0.14   0.30   0.45  0.61  0.69 ];
y=0; %V(T)=ln(a + b*T^2)
for k=1:m
   y=y+(log(x(1)+x(2)*T(k)^2)-V(k))*T(k)^2/(x(1)+x(2)*T(k)^2);
end
end