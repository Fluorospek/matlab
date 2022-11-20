clc;
clear all;

a=[1/3,1/2,-1/4; 1/5,2/3,3/8; 2/3,-2/3,5/8];
m=size(a,1); %no. of rows
n=size(a,2); %no. of columns
l=eye(m);
%j is for column
%i is for rows
for j=1:m-1
    for i=j+1:m
        l(i,j)=a(i,j)/a(j,j);
        a(i,:)=a(i,:)-(l(i,j)*a(j,:));
    end
end

l
a

% x(n)=a(n,n+1)/a(n,n);
% for i=n-1:-1:1
%     sum=0;
%     for j=i+1:n
%         sum=sum+a(i,j)*x(j);
%     end
%     x(i)=(a(i,n+1)-sum/a(i,i));
% end
