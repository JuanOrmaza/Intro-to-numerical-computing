function [x] = my_CG(A,b, tot_it)

x=zeros(size(A,1),1);
r=b-A*x;
s=r;


for k=1:tot_it
    ak=r'*r/(s'*A*s);
    x= x + ak*s;
    r_next = r-ak*A*s;
    beta = r_next'*r_next/(r'*r);
    s_next = r_next + beta*s;
    r=r_next;
    s=s_next;
end



end