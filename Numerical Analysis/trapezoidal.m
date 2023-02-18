clc;
clear all;

f=@(x) (exp(-x^2))*cos(x);
a=-1;
b=1;
N=6;
h=(abs(b-a))/N;
sum=0;
for i=1:(N-1)
    x=a+i*h;
    sum=sum+2*f(x);
end
I=(h/2)*(f(a)+sum+f(b));
I