function[x_arr] = my_newton(f, df, x0, tol)

x_arr = [x0];

a=x0;
b=x0-f(x0)/df(x0);
delta=(b-a);

i=2;

while (abs(delta)>tol)
   if(abs(f(x_arr(i-1)))<eps)
       break
   end
   x_arr(i)=x_arr(i-1)-f(x_arr(i-1))/df(x_arr(i-1));
   delta = x_arr(i)-x_arr(i-1);
   i=i+1;
end

end

