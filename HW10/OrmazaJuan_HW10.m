%% Homework 10 CS375
% Juan Alejandro Ormaza
% November 10 2021
clear all; clc; close all;
format long g;

%% Problem 1
    % a,b,c,d
    % see attachments

%% Problem 2

    % a: see attachments.
    
%% Problem 2.b
    f=@(x) x*sin(x);
    gauss_int(f,0,pi)
    
%% Problem 2.c
    comp_gauss_int(f,0,pi,10)

%% Problem 2.d

    exact_integral=pi;
    n=[4,8,16,32];
    p=zeros(1,length(n));
    error = zeros(1,length(n));
    h = zeros(1,length(n));
    integral_results = zeros(1,length(n));

    for i=1:length(n)
        integral_results(i) =  comp_gauss_int(f,0,pi,n(i));
        error(i) = abs(exact_integral-comp_gauss_int(f,0,pi,n(i)));
        h(i)=pi/n(i);
        if(i>=2)
            p(i)=log(error(i)/error(i-1))/log(h(i)/h(i-1));
        end
    end

fprintf(" n approx integral\t error\t\t\t convergence p\n");
fprintf("%2d %2.10f\t\t %2.16f\t %2.10f\n",[n;integral_results ;error; p])




