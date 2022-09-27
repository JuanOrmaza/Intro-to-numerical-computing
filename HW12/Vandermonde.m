% CS375 Vandermonde
% Juan Alejandro Ormaza
% November 30, 2021

function [V] = Vandermonde(x)

n=length(x)-1;
V=zeros(n+1,4);

for i=1:n+1
    for j=1:4
        if(j==1)
            V(i,j)=1;
        else
            V(i,j)=x(i)^(j-1);
        end
    end
end

end

