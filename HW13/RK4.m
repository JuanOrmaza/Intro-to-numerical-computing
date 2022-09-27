function [w,t] = RK4(f,delta,h)
% RK4
% Juan Alejandro Ormaza 
% DEC 7 2021

a=0;
b=2/delta;
N=(b-a)/h;

w = zeros(N+1,1);
t = zeros(N+1,1);

w(1)=delta;

for i = 1:N
    
    K1 = h*f(t(i),w(i));
    K2 = h*f(t(i)+(h/2),w(i)+(K1/2));
    K3 = h*f(t(i)+(h/2),w(i)+(K2/2));
    K4 = h*f(t(i)+h,w(i)+K3);
    
    w(i+1) = w(i) + ((K1+(2*K2)+(2*K3)+K4)/6);
    t(i+1) = a + (i*h);
end

end

