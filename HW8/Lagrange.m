% Juan Alejandro Ormaza
% October 25 2021

function [y] = Lagrange(X,Y,desiredX)
%Lagrange returns the value P(X) of a polynomial P that interpolates
% the data from X and Y. desiredX is an input that will calculate
% y = P(desiredX).

n=length(X);
l=zeros(1,n);

for k=1:n
    l(k)=1;
    for i=1:n
        if i~=k
            l(k)=l(k)*(desiredX-X(i))/(X(k)-X(i));
        end
    end
end
    
y=sum(l.*Y);





end

