%% CS375 HW11
% Juan Alejandro Ormaza
% November 16 2021
%
clc ;clear all; close all;
format long g
%% Problem 1.C

e= sqrt(eps)/4;
A=[1 e; e 1];

charPolynomial=charpoly(A) %characteristic polynomial

eigenvalues=roots(charPolynomial) %lambda 1 and lambda 2

%% Problem 1.E
% See attachments
%% Problem 1.F

e= sqrt(eps)/4;
A=[1 e; e 1];
x=[3;4];
tol1=1e-8;
tol2=1e-9;
tol3=1e-10;

[eval1,evec1]=power_method(A,x,tol1);
[eval2,evec2]=power_method(A,x,tol2);

% to run code just eliminate percentage sign:

%[eval3,evec3]=power_method(A,x,tol3);

eval1
evec1

eval2
evec2
%% Problem 2.A and 2.B
% see attachments




