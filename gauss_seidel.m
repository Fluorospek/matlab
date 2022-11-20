clc;
clear all;

A=[4.63 -1.21 3.22;
   -3.07 5.43 2.11;
   1.26 3.11 4.57];
b=[2.22 -3.17 5.11];
x0=[0 0 0];
x=[0 0 0];
tol=10^-3;
n=3;
N=100;
k=1;
while k<=N
    for i=1:n
        sum1=0;
        sum2=0;
        for j=1:i-1
            sum1=sum1+ A(i,j)*x(j);
        end
        for j=i+1:n
            sum2=sum2+ A(i,j)*x0(j);
        end
        
       % x(i)=(b(i)-sum1-sum2)/A(i,i);
         x(i)=(1/A(i,i))*(b(i)-sum1-sum2);
    
            if norm(x-x0)<tol  
            break
            end
    end
    k=k+1;
    x0=x;
    end  
disp(x)
A*(x')