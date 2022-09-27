function [result] = my_sin(x,n)
%My_sin calculates the taylor series approximation for sin(x) 
sum=0;
for i=0:n
    sum=sum+((-1)^i)*(((x).^(2*i+1))./factorial(2*i+1));
end
result = sum;
end

