clc;
clear all;

f=@(x) 2^x-5*x+2;
a=0;
b=1;
n=40;
c=0;
tol=10^-3;
if f(a)*f(b)<0
    for i=1:n
        c=(a+b)/2;
        if abs(b-c)<tol || abs(a-c)<tol
            break
        end
        if f(a)*f(c)<0
            b=c;
        elseif f(b)*f(c)<0
            a=c;
        end
    end
    fprintf('Root of the given equation is: %.4f',c);
else
    disp('No root between the given values');
end



























% clc
% clear all
% 
% a = 1;
% b = 10;
% c = (a + b)/2;
% tol = 0.001;
% 
% %Important to give Domain
% x = 0:10;   % == 0:1:10 , means x's Range is from 0 to 10 in the gaps of 1. (0,1,2,..,10)
% f = @(x) x.^2-4.*x-2;
% % "." used on x since by using ":" operator, we have created
% % created an array/matrix (range) for x. And "." is used to 
% % execute operation on each and every element.
% % Basically, always use "." for these purposes (./array/matrix)
% 
% plot(x,f(x))    %plot(x-axis,y-axis)
% grid            %puts grids in graph
% 
% while abs(f(c))>tol
%     if f(a)*f(c)<0
%         b=c;
%     else
%         a=c;
%     end
%     c=(a+b)/2;
% end
% 
% fprintf('Root = %f',c)