function[x_arr] = my_secant(f, x0, x1, tol)


x_arr = [x0,x1];
delta=x1-x0;

i=3;

while (abs(delta)>tol)
   if(abs(f(x_arr(i-1)))<eps)
       break
   end
   x_arr(i)=x_arr(i-1)-f(x_arr(i-1))*((x_arr(i-1)-x_arr(i-2))/(f(x_arr(i-1))-f(x_arr(i-2))));
   delta = x_arr(i)-x_arr(i-1);
   i=i+1;
end

end

