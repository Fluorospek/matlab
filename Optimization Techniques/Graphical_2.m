clc;
clear all;

%phase 1:Input Parameters
A=[1 2;
   1 1;
   0 1;];
B=[2000; 1500; 600];
C=[3 5];

%phase 2: Plotting the graph
x1=0:1:max(B);
y11=(B(1)-A(1,1).*x1)./A(1,2);
y21=(B(2)-A(2,1).*x1)./A(2,2);
y31=(B(3)-A(3,1).*x1)./A(3,2);
y11=max(0,y11);
y21=max(0,y21);
y31=max(0,y31);
plot(x1,y11,'r',x1,y21,'g',x1,y31,'b');
%hold on;
grid on;

%phase 3: find the corner points with axes
cx1=find(x1==0);
c1=find(y11==0);
line1=[x1(:,[c1 cx1]); y11(:,[c1 cx1])]';
c2=find(y21==0);
line2=[x1(:,[c2 cx1]); y21(:,[c2 cx1])]';
c3=find(y31==0);
line3=[x1(:,[c3 cx1]); y31(:,[c3 cx1])]';
corpt=unique([line1;line2;line3],'rows');

%phase4: find the points of intersection
pt=[0;0];
for i=1:size(A,1)
    A1=A(i,:);
    B1=B(i,:);
    for j=i+1:size(A,1)
        A2=A(j,:);
        B2=B(j,:);
        AA=[A1;A2];
        BB=[B1;B2];
        XX=AA\BB;
        pt=[pt XX];
    end
end
ptt=pt';

%phase 5: Write all the corner points
allpt=[ptt;corpt];
X=unique(allpt,'rows')

%phase 6: FInd the feasible region of the LPP
%constraint 1
x1=X(:,1);
x2=X(:,2);
cons1=x1+2.*x2-2000;
h1=find(cons1>0); %since according to the LPP, we want values <=0
X(h1,:)=[];
%constraint 2
x1=X(:,1);
x2=X(:,2);
cons2=x1+x2-1500;
h2=find(cons2>0);
X(h2,:)=[];
%constraint 3
x1=X(:,1);
x2=X(:,2);
cons3=x2-600;
h3=find(cons3>0);
X(h3,:)=[];
points=X;
%patch(points(:,1), points(:,2), 'red');
%hold off;

%phase 7: Find value of objective function
for i=1:size(points,1)
    fn(i,:)=sum(points(i,:).*C);
end
ver_fns=[points fn];

[fxval, fxindex]=max(fn);
optval=ver_fns(fxindex,:);
OPT_BFS=array2table(optval)