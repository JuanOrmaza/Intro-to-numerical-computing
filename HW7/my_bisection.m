function [x_arr] = my_bisection(f, c, d, tol)
    
x_arr = [0];

a=c;
b=d;

i=1;

while (abs(b-a)>tol)
   xm=a+(b-a)/2;
   
   if(abs(f(xm))<eps)
       break
   end
   
   if sign(f(xm)) == sign(f(a))
       x_arr(i)=xm;
       a=xm;
       i=i+1;
   else
       x_arr(i)=xm;
       b=xm;
       i=i+1;
   end
end

end

