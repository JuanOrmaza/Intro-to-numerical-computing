%% Homework 6
% Juan Alejandro Ormaza
% October 6 2021
clear all;clc; close all;
format LONG E

%% Problem 2.b

P=20;
A=gallery('poisson',P);
b = ones(P^2,1);

% Since both algorithms should be the same, I am going to use norm 2 to
% figure the difference between my_jacobi and my_vector_jacobi.

error = norm(my_jacobi(A,b,100)-my_vector_jacobi(A,b,100),2);
fprintf("the size of the differnce between my_jacobi and my_vector_jacobi is %2.8f\n",error);

%% Problem 2.c

% Since my_jacobi takes too long with p=20 I am going to use p=12 to
% calculate the time my algorithms take to run.

P=12;
A=gallery('poisson',P);
b = ones(P^2,1);

tic 
    x1=my_vector_jacobi(A,b,100);
t1=toc;
fprintf("my vector jacobi takes %2.8f seconds\n",t1);

tic 
    x2=my_jacobi(A,b,100);
t2=toc;
fprintf("my component-wise jacobi takes %10.8f seconds\n",t2);

fprintf("my_vector_jacobi is %10.8f times faster than my_jacobi\n", t2/t1);


%% Problem 2.d

P=[ 10, 20, 40, 80, 160];
error=zeros(size(P,2),1);

for i=1:size(P,2)
    A=gallery('poisson',P(i));
    b = ones(P(i)^2,1);
    xtrue=A\b;
    x=my_vector_jacobi(A,b,100);
    error(i)=norm(xtrue-x,2)/norm(xtrue,2);
end

%% Problem 3.c

tot_it = [50, 100, 200, 400, 800, 1600];
error=zeros(size(tot_it,2),3);

for i=1:size(tot_it,2)
    A=gallery('poisson',160);
    b = ones(160^2,1);
    xtrue=A\b;
    x_jacobi=my_vector_jacobi(A,b,tot_it(i));
    x_CG=my_CG(A,b,tot_it(i));
    x_gauss=my_gauss_siedel(A,b,tot_it(i));
    error(i,1)=norm(xtrue-x_jacobi,2)/norm(xtrue,2);
    error(i,2)=norm(xtrue-x_gauss,2)/norm(xtrue,2);
    error(i,3)=norm(xtrue-x_CG,2)/norm(xtrue,2);
end

fprintf("Num Iterations\tError Jacobi\tError GS\tError CG\n");
for i=1:size(tot_it,2)
fprintf("%4.0f\t\t %2.5f\t%2.5f\t\t%2.5f\t\n",tot_it(i),error(i,1),error(i,2),error(i,3));
end

%% Problem 4.a
P=10;
A=gallery('poisson',P);
b = ones(P^2,1);

nonZeros = nnz(A)/size(A,1);

fprintf("The number of nonzeros in A is %3.6f\n", nonZeros);
fprintf("As P increases the number of nonzeros approaches 5.")

%% Problem 4.b

fprintf("see in attached written solutions.\n")


