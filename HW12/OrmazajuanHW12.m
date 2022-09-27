%% CS375 HW12
% Juan Alejandro Ormaza
% November 30, 2021

clear all;
clc;
close all;

%% Problem 2c

A= [1 -1;2 3];
b=[1;1];

qr_solve(A,b)

%% Problem 3a

N=100;

[x,y] = generate_ls_data(N);

figure();
plot(x,y,'o');
xlabel('x');
ylabel('y');


%% Problem 3b

% A'Ax=A'b

V=Vandermonde(x);

AtA=V'*V;
AtB=V'*y;
c=AtA\AtB;

coefficients = c;
coefficients=rot90(coefficients);
coefficients=rot90(coefficients);

xfine = linspace(0,1,1000);
yfine = polyval(coefficients,xfine);

figure();
plot(x,y,'o');
hold on
plot(xfine,yfine);
xlabel('x');
ylabel('y');

fprintf("the coefficients are: \n")
coefficients

%% Problem 3c

b=y;
c2=qr_solve(V,b);

coefficients2 = c2(1:4);
coefficients2=rot90(coefficients2);
coefficients2=rot90(coefficients2);

xfine = linspace(0,1,1000);
yfine = polyval(coefficients2,xfine);

figure();
plot(x,y,'o');
hold on
plot(xfine,yfine);
xlabel('x');
ylabel('y');

fprintf("the coefficients are: \n")
coefficients2



%% Problem 3d
A=V;

[U,S,V] = svd(A);
sigma=inv(S(1:4,1:4));
c3=zeros(4,1);

Ut=U';

for i=1:4
    c3(i)=sum((sigma(i,i)*Ut(i,i).*b)*V(i,i));
end


coefficients3 = c3(1:4);
coefficients3=rot90(coefficients3);
coefficients3=rot90(coefficients3);


xfine = linspace(0,1,1000);
yfine = polyval(coefficients3,xfine);

figure();
plot(x,y,'o');
hold on
plot(xfine,yfine);
xlabel('x');
ylabel('y');

fprintf("the coefficients are: \n")
coefficients3


%% Problem 4c

f=@(u,t) -u^2 - 2*sin(2*t) + (cos(2*t))^2;

a=0;
b=1;
u0=1;

n = [10, 20, 40, 80];
error=zeros(length(n),1);
valAt1=zeros(length(n),1);
h = (b-a)./n;

p=zeros(length(n),1);

for i=1:length(n)
    y=euler(n(i),a,b,u0,f);
    valAt1(i)=y(end);
    error(i)=abs(cos(2*1)-valAt1(i));
    if(i>1)
        p(i)=log(error(i)/error(i-1))/log(h(i)/h(i-1));
    end
end

fprintf("h\t\t approximation t=1\t error\t\t order of convergence p\n");
fprintf("%1.6f\t %1.6f\t\t %1.10f\t %2.3f\n",[h ;valAt1'; error'; p'])




