function [x] = my_jacobi(A,b,tot_it)

n=size(A,1);
x=zeros(n,1);
x_next = zeros(n,1);


for k=1:tot_it
    for i=1:n
        sum = 0;
        for j=1:n
           if(i~=j)
               sum= sum + A(i,j)/A(i,i) *x(j);
               x_next(i) =  - sum + b(i)/A(i,i);
           end
           
        end
    end
    x=x_next;
end
    
end

