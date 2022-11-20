clc;
clear all;

A=[4 1 0;
   1 20 1;
   0 1 4;];
x0=[1; 1; 1;];
k1=100;
MAX=100;
tol=10^-3;
for j=1:MAX
    y=A*x0;
    k=max(abs(y));
    x=y/k;
    if abs(k1-k)<tol
        break;
    end
    x0=x;
    k1=k;
end
fprintf('Lagest Eigen value\n');
k
x