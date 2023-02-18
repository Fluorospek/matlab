clc
clear all
%syms x;
f=@(x)x^2-17;
x0=0;
x1=1;
tol=10^(-5);
n=10;
for i=1:n
    x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
    if abs((x2-x1))<tol
        fprintf('The root is %f',x2)
        break;
    else
        x0=x1;
        x1=x2;
    end
end