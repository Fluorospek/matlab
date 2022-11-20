clc;
clear all;

x=[1 1.5 2 2.5];
f=[2.7183 4.817 7.3891 12.1825];
n=length(x);
DD=zeros(n);
DD(:,1)=f;
for j=2:n
    for i=j:n
        DD(i,j)=(DD(i,j-1)-DD(i-1,j-1))/(x(i)-x(i-j+1));
    end
end

DD
y=2.25;

for i=1:n
    pro(i)=1;
    for j=1:i-1
        pro(i)=(y-x(j))*pro(i);
    end
end

sum=0;
for i=1:n
    sum=sum+pro(i)*DD(i,i);
end

sum