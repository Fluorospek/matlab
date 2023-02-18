clc;
clear all;

C=[3 5];
A=[1 2; 1 1;0 1];
B=[2000;1500;600];

ineq_sign=[0 0 1];
%0 is for <=, 1 is for >=

s=eye(size(A,1)); %identity matrix with size= no. of rows of A
index=find(ineq_sign>0);

s(index,:)=-s(index,:);

obj_funs=array2table(C);
obj_funs.Properties.VariableNames(1:size(C,2))={'x1','x2'};
H=[A s B];
constraint=array2table(H);
constraint.Properties.VariableNames(1:size(H,2))={'x1','x2','s1','s2','s3','sol'};

constraint

