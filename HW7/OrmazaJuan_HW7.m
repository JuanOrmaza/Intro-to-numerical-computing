%% Homework 7
% Juan Alejandro Ormaza
% October 19 2021
% CS375
clear all; clc; close all;
format long e

%% Problem 1
f_x=@(x) x.^3 - 8;
d_f=@(x) 3*x.^2;

x=linspace(-5,5,100);

figure()
plot(x,f_x(x))
hold on
plot(2,0,'bo')
title('Problem 1');
xlabel('x');
ylabel('y=x^3 - 8');
grid on

fprintf("there is only one zero at x=2\n\n")

%% Problem 2 and 3

TOL=10^(-10);

x_bisection = my_bisection(f_x,1,4,TOL);

x_newton = my_newton(f_x,d_f,4,TOL);

x_secant = my_secant(f_x,1,4,TOL);

fprintf("the root of the bisection method is %2.14f and it took %3.0f iterations\n\n",x_bisection(end),length(x_bisection));

fprintf("the root of Newton's method is %2.14f and it took %3.0f iterations\n\n",x_newton(end),length(x_newton));

fprintf("the root of the Secant method is %2.14f and it took %3.0f iterations\n\n",x_secant(end),length(x_secant));

%% Problem 4

ek_bisection = abs(x_bisection-2);

ek_newton = abs(x_newton-2);

ek_secant = abs(x_secant-2);


ek1_bisection = circshift(ek_bisection,-1);

ek1_newton = circshift(ek_newton,-1);

ek1_secant = circshift(ek_secant,-1);


bisection_conv = ek1_bisection./ek_bisection;
bisection_conv(length(bisection_conv))=0;

newton_conv = ek1_newton./(ek_newton.^2);
%newton_conv(length(newton_conv))=0;

secant_conv = ek1_secant./(ek_secant.^(1.62));
%secant_conv(length(secant_conv))=0;


iter1=1:1:length(x_bisection);

iter2=1:1:length(x_newton);

iter3=1:1:length(x_secant);

fprintf("Bisection method:\n")
fprintf("iteration\t error\t\t convergence rate\n")
fprintf("%3.0f \t    %3.12f \t %3.12f\n",[iter1;ek_bisection;bisection_conv])
fprintf("\n")

fprintf("\nNewton's method:\n")
fprintf("iteration\t error\t\t convergence rate\n")
fprintf("%3.0f \t    %3.12f \t %3.12f\n",[iter2;ek_newton;newton_conv])
fprintf("\n")

fprintf("\nSecant method:\n")
fprintf("iteration\t error\t\t convergence rate\n")
fprintf("%3.0f \t    %3.12f \t %3.12f\n",[iter3;ek_secant;secant_conv])
fprintf("\n")


%% Problem 5

% BY HAND PROBLEM ATTACHED TO PDF



