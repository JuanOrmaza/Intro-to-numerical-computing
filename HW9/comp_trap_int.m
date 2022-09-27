%% Juan Alejandro Ormaza
% Composite trapezoid integral

function integral = comp_trap_int(f,a,b,n)

h = (b - a)/n;
sum = (f(a) + f(b))/2;
x=a:h:b;
for i = 1:n-1
    sum = sum + f(x(i));
end
integral = sum * h;

end

