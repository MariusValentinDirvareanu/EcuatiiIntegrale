clc; clear all; close all;

function f=f(x)
    f=pi*x/25*(cos(alpha*pi)-1)+sin(alpha*x);
end

function k=k(x,y)
    k=x*y/25;
end

function phi=phi(t)
    phi=f(t)+int((k(t,s)*phi(s)),s,0,pi)
end


I=40;

for i=1:I+1 
   phi(i)
end