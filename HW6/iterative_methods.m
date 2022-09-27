% Random sparse matrix, but shifted to become diagonally dominant
%
% Experiment: How does shift size affect Jacobi's convergence?

% Random SPD matrix, with 5 nonzeros per row
n = 50;
A = sprand(n,n,5);
A = A*A';

% Add to the diagonal to make matrix diagonally dominant
rowsum = abs(A)*ones(n,1);
A = A + 1.0*max(rowsum)*speye(n,n);  % Set shift size here 
D = diag(A);

% Jacobi
rnorms = zeros(10,1);
b = rand(n,1);
x = rand(n,1);
for i = 1:10
    r = b - A*x;
    rnorms(i) = norm(r);
    x = x + r./D;
end

% Print relative residual reduction
% We spent O(m n) work here, with m=5 entries per row, and n=50 
% rows.  This is WAY better than O(n^3).
rnorms/rnorms(1)

%%
% Now, try Matlab's built-in CG
% Note, how much faster it is...
[x,flag,relres,iter,resvec] = pcg(A,b,1e-6);
resvec/resvec(1)

