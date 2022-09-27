% Juan Alejandro Ormaza
% Algorithm based on Burden's Numerical Analysis 9th edition

function [eval2] = power_method_mod(A,x,tol)

    k=1;
    N=1e100;
    
    x=x/norm(x,inf); %normalized
  
    
    while k<N
        y=A*x;
        
        lambda=norm(y,inf);
       
        error=norm((x-(y/norm(y,inf))),2);
        x=y/norm(y,inf);
        
        if error<tol
            break;
        end
        
        k=k+1;
    end
    
    evec=x;
    eval=lambda; 
    
    B= A-(eval/(evec'*evec))*(evec*evec');
    eval2=eig(B);
    eval2=eval2(2);
 


end

