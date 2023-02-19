clc;
clear all;

C=[2 3 4 7];
A=[2 3 -1 4;1 -2 6 -7];
B=[8;3];

m=size(A,1);
n=size(A,2);

s_no=nchoosek(n,m)
t=nchoosek(1:n,m);
t  % no. of basic variable pairs

sol=[];

if n>=m
    for i=1:s_no
        y=zeros(n,1);
        x=A(:,t(i,:))\B;
        if all(x>=0 & x~=inf & x~=-inf)
            y(t(i,:))=x;
            sol=[sol y];
        end
    end
else
    error('No. of equations is larger');
end

Z=C*sol;
[Zmax,Z_index]=max(Z);
BFS=sol(:,Z_index);

opval=[BFS' Zmax];
optimal_BFS=array2table(opval);
optimal_BFS.Properties.VariableNames(1:size(optimal_BFS,2))={'x1','x2','x3','x4','value of Z'};

optimal_BFS