function [x] = my_vector_jacobi(A,b, tot_it)
x=zeros(size(A,1),1);

Q = diag(diag(A));

for k=1:tot_it
    r = b - A*x;
    x = x + Q\r;
end


end

