%% Ormaza Juan Comp_Gauss_int

function integral = comp_gauss_int(f,a,b,n)

x0=a;
h=(b-a)/n;
sum = 0;
xi=0;
x_interval = [x0,xi];

for i=1:n
    xi=x0+i*h;
    x_interval(2)=xi;
    sum=sum+gauss_int(f,x_interval(1),x_interval(2));
    x_interval(1)=xi;
end 

integral = sum;

end

