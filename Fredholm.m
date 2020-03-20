
function [ U ] = Fredholm
% Finaru Roxana-Ioana gr 1341
% Date pb: a,b \in R, f functie, f:[a,b]->R; k functie,
% k:[a,b]x[a,b]->R,nucleu
% din 2 si 3 => u:[a,b]->R, u(x)=...
%  Date utilizator N,I
clc
close all
 a=0; b=pi; alpha=3;
 
    function w=f(x)
        w=pi*x/25*(cos(alpha*pi)-1)+sin(alpha*x);
    end

    function p=k(x,y)
        p=x*y/25;
    end
 
f(pi)

 N=5; I=40;
 h=(b-a)/I;
 x(1)=a;
 for i=1:I
     x(i+1)=x(i)+h;
 end
 
  for i=1:I+1 
     U(1,i)=f(x(i));
 end
 

 plot(x,U(1,i))
 hold on; 
 
 for n=1:N
     for i=1:(I+1)
         for j=1:(I+1)
             val(j)=k(x(i),x(j))*U(n,j);
         end
         U(n+1,i)=trapz(x,val)+f(x(i));
         
     end
     plot(x,U(n+1,:));
     hold on;
 end
 

end

