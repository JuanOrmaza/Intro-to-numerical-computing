function integral = simp_int(f,a,b,n)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
h= (b-a)/n;
sum = f(a) + f(b);
for i = 1 : n/2
    x_i = a + (2*i - 1)*h;
    sum = sum + 4*f(x_i);
end
for i = 1 : n/2-1
    x_i = a + 2*i*h;
    sum = sum + 2*f(x_i);
end
integral = sum*(h/3);
end

