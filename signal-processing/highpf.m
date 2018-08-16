function [X_filtered] = highpf(X, sample,high,n)

hWn = high/sample*2;

[b,a] = butter(n,hWn,'high');
X_filtered = filtfilt(b,a,X);
