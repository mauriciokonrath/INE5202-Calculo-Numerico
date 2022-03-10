format long 
n=2; 
xi=[+1. +1.] 
k=0; 
tol=1.e-2; 
dif=1; 
while ( dif>tol && k<15 ) 
 k=k+1; 
 a(1,1)=cos(xi(1)); a(1,2)=-sin(xi(2)); 
 a(2,1)=2*xi(1); a(2,2)=2*xi(2); 
 a(1,3)=-(sin(xi(1))+cos(xi(2))-1.); 
 a(2,3)=-(xi(1)^2 +xi(2)^2 -3.); 
 dx=fgauss(n,a); %resolve sistema por Gauss 
 x=xi+dx; 
 dif=max(abs(dx)); 
 xi=x; 
end%while 
x 
dif