clc;
clear all;

syms x;
f=@(x) x^2-17;
x0=1;
tol=10^(-5);
n=10;
df=diff(f(x));
if df(x0)~=0
for i=1:n
    x1=x0-(f(x0)/df(x0));
    if abs(x0-x1)<tol
        fprintf('The root is %f',x1)
        break;
    else
        x0=x1;
    end
end
end