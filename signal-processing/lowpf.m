function[X_filtered]=lowpf(X,sample,low,n)

Wn = low/sample*2;
[b,a] = butter(n,Wn);
X_filtered = filtfilt(b,a,X);