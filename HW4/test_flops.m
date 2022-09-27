
% 1) Test inner-product, observe O(n) by estimating the rise/run in the plot
ns = [5*10^4, 5*10^5, 10^6, 10^7, 10^8];

for i=1:5
    n = ns(i);
    
    %Create two random vectors of size n
    u = rand(n,1); 
    v = rand(n,1);

    %Measure time using the cputime command
    t = cputime;

    %Do the epxeriment 100 times (Why?)
    for j = 1 : 100 
       ip = u'*v;    %Compute Inner Product
    end

    %average the times
    times(i) = (cputime-t)/100.;
end
figure(1)
loglog(ns, times, 'LineWidth',3)
ax = gca;
ax.FontSize = 18; 
title('Dot-Product, O(n)','fontsize',18)
ylabel('Time','fontsize',18)
xlabel('N','fontsize',18)


% 2) Test mat-vec, observe the O(n^2) runtime for a single mat-vec 
%    by estimating the rise/run in the plot
ns = [1000, 2000, 4000, 8000, 12000]; 
for i=1:5
    n = ns(i);
    %Create random matrix and vectors of size n
    A = rand(n,n); 
    v = rand(n,1);

    %Measure time using the cputime command
    t = cputime;

    %Do the epxeriment 10 times
    for j = 1 : 10 
       ip = A*v;    % Compute mat-vec
    end

    %average the times
    times(i) = (cputime-t)/10;
end
figure(2)
loglog(ns, times, 'LineWidth',3)
ax = gca;
ax.FontSize = 18; 
title('MatVec O(n^2)','fontsize',18)
ylabel('Time','fontsize',18)
xlabel('N','fontsize',18)
