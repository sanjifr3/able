function [X_filtered] = detrend2(X)

[p,s,mu] = polyfit((1:numel(X))',X,6);
f_y = polyval(p,(1:numel(X))',[],mu);

X_filtered = X - f_y;