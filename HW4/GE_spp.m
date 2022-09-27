function [x, A, b] = GE_spp(A,b)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
n=size(A,1);
L=1:1:n;
s=zeros(n,1);

for i=1:n
    s(i)=max(A(i,:));
end

for k=1:n
    rmax=0;
    for i=k:n
        r=abs(A(L(i),k)/s(L(i)));
        if(r>rmax)
            rmax=r;
            j=i;
        end
    end
    value1=L(j);
    value2=L(k);
    L(k)=value1;
    L(j)=value2;
    for i=k+1:n
       xmult=A(L(i),k)/A(L(k),k);
       A(L(i),k)=xmult;
       for j=k+1:n
           A(L(i),j)=A(L(i),j)-xmult*A(L(k),j);
       end
    end
end
   
for k=1:n-1
    for i=k+1:n
        b(L(i))=b(L(i))-A(L(i),k)*b(L(k));
    end
end

x=zeros(n,1);
x(n)=b(L(n))/A(L(n),n);

for i=n-1:1
    sum=b(L(i));
    for j=i+1:n
        sum=sum-A(L(i),j)*x(j);
    end
    x(i)=sum/A(L(i),i);
end


end

