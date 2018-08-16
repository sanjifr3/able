function [X_filtered] = normal(X,Max);

switch nargin
    case 2
        X_filtered = X/Max*100;
    case 1
        Max = max(X);
        X_filtered = X/Max*100;
    otherwise
        X_filtered = 0;
end