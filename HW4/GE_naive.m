function [x, A, b] = GE_naive(A, b)
% Input parameters:     A : n x n matrix 
%                       b : n x 1 vector
%
% Output parameter:     x : n x 1 vector,  The solution to linear system 
%                           A x = b, solved with naive Gaussian elimination
%                       A, b modified by Gaussian elimination
%

% Begin forward elimination
n = size(A); n = n(1);
for k = 1:(n-1)
   
    for i = k+1:n
       
        xmult = A(i,k)/A(k,k);
        % Store multipliers, or set to 0
        %A(i,k) = xmult;
        A(i,k) = 0;
        
        for j = k+1:n
            A(i,j) = A(i,j) - xmult*A(k,j);
        end
        
        b(i) = b(i) - xmult*b(k);
    end
    
end
    
% Begin back-substitution, A is now upper-triangular
x = zeros(n,1);
x(n) = b(n)/A(n,n);
for i = n-1:-1:1
    s = b(i);
    for j = i+1:n
        s = s - A(i,j)*x(j);
    end
    x(i) = s/A(i,i);
end
