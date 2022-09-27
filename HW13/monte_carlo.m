function I = monte_carlo(f, a, b, N)
% Montecarlo
% Juan Alejandro Ormaza 
% DEC 7 2021

x = a + (b-a).*rand(N,1);

A=f(x);

I=sum(A)/N;

end

