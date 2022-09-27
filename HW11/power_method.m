%Juan Alejandro Ormaza
% Algorithm based on Burden's Numerical Analysis 9th edition

function [eval, evec] = power_method(A,x,tol)

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
    
    eval=lambda;
    evec=x;
    


end

