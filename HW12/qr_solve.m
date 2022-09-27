% CS375 qr solve
% Juan Alejandro Ormaza
% November 30, 2021

function x = qr_solve(A,b)

[Q,R] = qr(A);

C=Q'*b;

x=R\C;

end

