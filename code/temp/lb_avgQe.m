%Expectstion wrt U, is taken INSIDE the log to get avg Qe
%Expectation wrt sigma, is taken INSIDE the log 
%Quantisation simulation for 10x2 MIMO
%Assuming channel covariance is identity and is same for all users

clear all; close all; 
nu_func_file;
M=10; %no. of transmit antanna
K=2; %no. of users with single antenna
P_dB = 10; %total transmit power
P=10.^(P_dB/10);
No=1;
iter=500;

bits=[1:14];
rate_actu=zeros(1,length(bits));
rate_lb=zeros(1,length(bits));

c=0;
for ll=1:iter
 h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
 [U S V] = svd(h,"econ");
 sigma = diag(S);
 Pd=waterfill_No(sigma,P,No);
 CC=S*diag(Pd)*S';
 CC=diag(CC);
 idx=randperm(K,1);
 c=c+CC(idx);
end
c=c/iter;

Qe=zeros(K,K,length(bits));
for ll=1:iter
 h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
 [U S V] = svd(h,"econ");
 for kk=1:length(bits)
  UHat=param(U,bits(kk));
  #UHat=reduced_param(U,bits(kk));
  B=UHat'*U-eye(K);
  Qe(:,:,kk)=Qe(:,:,kk)+B*B';
 end 
end
Qe=Qe./iter;

  
iter=1;
 for ll=1:iter
 h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
 [U S V] = svd(h,"econ");
 for kk=1:length(bits)
 #UHat=param(U,bits(kk));
 UHat=reduced_param(U,bits(kk));
 
 sigma = diag(S);
 Pd=waterfill_No(sigma,P,No);
 %%Rate with full CSIT and CSIR
 rate_ac=0;
 for i=1:K
  rate_ac = rate_ac+ real(log2(1+ (Pd(i) * (sigma(i)^2))/No)); 
 end
 rate_actu(kk) = rate_actu(kk)+rate_ac;
 
 %%Finding lower bound
 rh=0;
 for i=1:K
   rh= rh + log2(1+c*Qe(i,i,kk));
 end
 rate_low = rate_ac - rh;
 rate_lb(kk) = rate_lb(kk) + rate_low; 
 end
 
 end
 
 rate_actu=rate_actu/iter;
 rate_lb=rate_lb/iter;
 figure;
 plot(bits,rate_actu,'-*','linewidth',1.5);
 hold on;
 plot(bits,rate_lb,'-*','linewidth',1.5);
 legend('Actual, Expectation inside log','Lower bound, Expectation inside log');
 title('Expectation wrt sigma is taken INSIDE log & Expectation wrt U is taken INSIDE log');
