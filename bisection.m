clc;
clear all;

f=@(x)x^2-29;
a=5;
b=6;
tol=0.001;
if f(a)*f(b)>0
    disp('Wrong values of a and b');
else
    while abs(a-b)>=tol
        c=(a+b)/2;
        if f(a)*f(c)<0
            b=c;
        else
            a=c;
        end
    end
    c
end