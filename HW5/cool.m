%% Homework 5 problem 1 c
% Juan Alejandro Ormaza
% September 28 2021

format long e
clear all;clc;
%% problem 1


A=rand(3,3);
fprintf("the condition umber for the matrix above with norm 2 is %1.5f\n",cond(A,2));
fprintf("the condition number for the matrix above with norm 2 is %1.5f\n",cond(A,1));

A