function [X_filtered,tnew] = avg(t,X,period)

elements = round(max(t)/period);

if(elements-1)*period < max(t)
    elements = elements + 1;
    
end
X_filtered = zeros(elements,1);
tnew = transpose([0:period:(elements-1)*period]);
j = 1;
for i=2:length(tnew)
    n = 0;
    while t(j)<=tnew(i)
        X_filtered(i) = X_filtered(i)+X(j);
        n = n+1;
        j = j+1;
        if j>= length(X)
            break;
        end
    end
    X_filtered(i) = X_filtered(i)/n;
end

        
    
    