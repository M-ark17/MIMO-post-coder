clear all;
close all;
clc;
PdB = 10;
P = 10^(PdB/10);
k = 2;
iter = 100000;
Rate = 0;
for i = 1:iter
  H = randn(k)+1j*randn(k);
  [u,s,v] = svd(H);
  RateTemp = log2(1+P*s(1));
  Rate += RateTemp;
end
disp(Rate/iter);
