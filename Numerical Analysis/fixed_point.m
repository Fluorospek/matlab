clc;
clear all;


N=10;
x0=1; %initial guess
tol=0.001;
g=@(x) tan(x)/4;

for i=1:N
    x1=g(x0);
    if abs(x1-x0)<tol
        fprintf('Solution of the given eqn. is %f',x1)
        break
    end
    x0=x1;
end

if i==N
    fprintf('Solution not found')
end