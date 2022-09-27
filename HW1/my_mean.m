function [result] = my_mean(fun,a,b,N)
%my_mean Summary of this function goes here
if b >= a
    h=(b-a)/(N-1);
    n=linspace(1,N,N);
    x_j=a+(n-1)*h;
    x_jsum=x_j(2:N-1);
    y=fun(x_jsum); 
end
result = (h/2)*(x_j(1)+x_j(N)) + h*sum(y);
end

