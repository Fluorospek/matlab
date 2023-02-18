%Graphical Method
clc;
clear all;
syms x;
syms y;
%Step 1
C=[3, 5];
A=[1, 2;1, 1;0, 1];
B=[2000;1500;600];
X = [x;y];
%step 2

h=100;
x=0:h:max(B);
y1=(B(1)-A(1,1).*x)./A(1,2);
y1=max(0,y1);

y2=(B(2)-A(2,1).*x)./A(2,2);
y2=max(0,y2);

y3=(B(3)-A(3,1).*x)./A(3,2);
y3=max(0,y3);
plot(x,y1,'r',x,y2,'g',x,y3,'b');
xlabel('Value of x')
ylabel('Value of y')

gtext('x+2y<=2000')
gtext('x+y<=1500')
gtext('y<=600')

grid on


%Step 3

cx = find(x==0)
cy1 = find(y1==0)
line1 = [x(:,[cy1,cx]); y1(:,[cy1,cx])]';

cy2 = find(y2 ==0)
line2 = [x(:,[cy2,cx]); y2(:,[cy2,cx])]';

cy3 = find(y3 == 0)
line3 = [x(:,[cy3,cx]); y3(:,[cy3,cx])]';

% all_points = [line1, line2, line3, 'rows'];
% all_points = unique(all_points);

all_unique = unique([line1;line2;line3], 'rows');
all_unique

%Step 4

value = [0;0];

for i = 1:size(A,1)
               row1 = A(i,:);
               rhs1 = B(i,:);
               for j = i+1: size(A,1)
                               row2 = A(j,:);
                               rhs2 = B(j,:);
                               AA = [row1; row2];
                               BB = [rhs1; rhs2];
                               XX = AA\BB;
                               value = [value, XX];
               end
end
points = value';
disp('All the intersecing points are == > ')
disp (points)


% Step 5

all = [points ; all_unique];
all_points = unique(all, 'rows');
disp('collecting all the points we got ==> ')
disp(all_points)

% Step 6

PT = constraint(all_points);
PT = unique(PT, 'rows');

% Step 7

for i =1 : size(PT,1)
                fx (i,:) = sum(PT(i,:).*C);
end
vert_fns = [PT, fx];
vertex = array2table(vert_fns);

% funcion out = constraint(X);
% X1 =X(:,1);
% X2 = X(:,2);
% cons1 = X1 + 2.*X2 -2000;
% h1 = find(cons1 > 0);
% X(h1,:) = [];
% 
% X1 =X(:,1);
% X2 = X(:,2);
% cons2 = X1 + X2 -1500;
% h2 = find(cons2 > 0);
% X(h2,:) = [];
% 
% X1 =X(:,1);
% X2 = X(:,2);
% cons3 = X2 - 600;
% h3 = find(cons3 > 0);
% X(h3,:) = [];
% 
% out = X;
% end

% Step 8

[fxvalue ,indfx] = max(fx);
optimal = vert_fns(indfx,:);
optima_BS = array2table(optimal)
