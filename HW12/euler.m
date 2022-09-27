% CS375 euler
% Juan Alejandro Ormaza
% November 30, 2021

function [u] = euler(n,a,b,u0,f)

h=(b-a)/n;
u=zeros(n,1);
t=a:h:b;
u(1)=u0;
for i=1:n-1
    u(i+1)=u(i)+ h*f(u(i),t(i));
end

