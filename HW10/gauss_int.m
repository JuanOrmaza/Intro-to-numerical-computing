%% Ormaza Juan Gauss_int

function integral = gauss_int(f,a,b)

w0=5/9;  w1=8/9; w2=5/9;
t0=-sqrt(3/5); t1=0; t2=-t0;

x_t=@(t) ((b-a)/2)*t + (b+a)/2;
dx = (b-a)/2;

integral = dx*(w0*f(x_t(t0))+w1*f(x_t(t1))+w2*f(x_t(t2)));

end

