%% Juan Alejandro Ormaza
% spline degree 3 coefficient

function [z] = spline3_coeff(t,y)

ti=t;
ti1=circshift(t,-1);

yi=y;
yi1=circshift(y,-1);


h= ti1(1:length(t)-1)-ti(1:length(t)-1);
b=(1./h).*(yi1(1:length(y)-1)-yi(1:length(y)-1));


A=zeros(length(t),length(t));
A(1,1)=1;
A(end,end)=1;


for i=2:length(t)-1
    for j=1:length(t)
        if(j==i)
            A(i,j)=2*(h(i)+h(i-1));
        end
        if(j==i-1)
            A(i,j)=h(i-1);
        end
        if(j==i+1)
            A(i,j)=h(i);
        end
    end
end

v=zeros(length(t),1);

for i=2:length(t)-1
    v(i)=6*(b(i)-b(i-1));
end


z=A\v;
