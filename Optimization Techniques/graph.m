clc;
clear all;

%phase 1: input parameters
c=[3 5];
a=[1,2;
   1,1;
   0,1];
b=[2000;1500;600];

%phase 2:plotting the graph
h=100
x=0:h:max(b);
y1=(b(1)-a(1,1).*x)./a(1,2);
y2=(b(2)-a(2,1).*x)./a(2,2);
y3=(b(3)-a(3,1).*x)./a(3,2);
y1=max(0,x11);
y2=max(0,x12);
y3=max(0,x13);

plot(x,y1,'r',x,y2,'g',x,y3,'b');
xlabel('Value of x');
ylabel('Value of y');
legend('x1+2x2=2000','x1+x2=1500','x2=600');
grid on;

%phase 3: find corner point with axes
cx=find(x==0); % x axis intersection
cy1=find(y1==0); %y axis intersection
line1=[x(:,[cy1 cx]),y1(:,[cy1 cx])]';
cy2=find(y2==0);
line2=[x(:,[cy2 cx]),y2(:,[cy2 cx])]';
cy3=find(y3==0);
line3=[x(:,[cy3 cx]),y3(:,[cy3 cx])]';

all_unique=unique([line1;line2;line3],'rows');
all_unique

%phase 4: find point of intersection
value=[0;0];

for i=1:size(A,1)
    row1=A(1,:);
    rhs1=B(i,:);
    for j=i+1:size(A,1)
        row2=A(j,:);
        rhs2=B(j,:);
        AA=[row1;row2];
        BB=[rhs1;rhs2];
        XX=AA\BB;
        value=[value,XX];
    end
end
points=value';
disp('All the intersecting points are: ');
disp(points);

%phase 5:Write all the corner points
all=[points;all_unique];
all_points