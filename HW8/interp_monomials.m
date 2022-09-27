% Juan Alejandro Ormaza
% October 25 2021

function [c] = interp_monomials(x,y)

n=length(x)-1;
V=zeros(n+1,n+1);

for i=1:n+1
    for j=1:n+1
        if(j==1)
            V(i,j)=1;
        else
            V(i,j)=x(i)^(j-1);
        end
    end
end

c=V\y';



end

