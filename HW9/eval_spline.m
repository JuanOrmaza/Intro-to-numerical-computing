function y_eval = eval_spline(x,t,y,z)

%Inputs: 
% x: Scalar where spline is to be eval
% t: Vector of x-values of the data points
% y: Vector of y-values of the data points
% z: Vector of spline coefficients

%Outputs
%y_eval: scalar value giving S(x)

num_pts = length(y);

sp_index = num_pts-1;

for i = num_pts-1:-1:1
    if x >= t(i)
        sp_index = i;
        break;
    end
end
h = t(sp_index+1) - t(sp_index);
tmp = z(sp_index)/2 + (x - t(sp_index))*(z(sp_index+1) - z(sp_index))/(6*h);
tmp = -(h/6)*(z(sp_index+1) + 2*z(sp_index)) + (y(sp_index+1) - y(sp_index))/h + (x-t(sp_index))*tmp;
y_eval = y(sp_index) + (x-t(sp_index))*tmp;

end
