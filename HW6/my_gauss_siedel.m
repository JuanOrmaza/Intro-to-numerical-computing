function [x] = my_gauss_siedel(A,b, tot_it)
x=zeros(size(A,1),1);

Q = tril(A);

for k=1:tot_it
r = b - A*x;
x = x + Q\r;
end


end
