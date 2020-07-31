%Expectstion wrt U, is taken INSIDE the log to get avg Qe
%Expectation wrt sigma, is taken INSIDE the log 
%Quantisation simulation for 10x2 MIMO
%Assuming channel covariance is identity and is same for all users

clear all; close all; 
nu_func_file;
theoritical_Qe_cal;
M=10; %no. of transmit antanna
K=2; %no. of users with single antenna
P_dB =[0 10 20 30]; %total transmit power
P=10.^(P_dB/10);
No=1;
iter=500;
bits=[1:14];
rate_actu=zeros(1,length(bits));
rate_lb=zeros(1,length(bits));
rate_ratio = zeros(length(P),length(bits));
for ll=1:length(P)
  c=0;
  for lj=1:iter
    h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
    [U S V] = svd(h,"econ");
    sigma = diag(S);
    Pd=waterfill_No(sigma,P(ll),No);
    CC=S*diag(Pd)*S';
    CC=diag(CC);
    idx=randperm(K,1);
    c=c+CC(idx);
  end
  c=c/iter;

  h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
  [U S V] = svd(h,"econ");
  for kk=1:length(bits)
    UHat=param(U, bits(kk), bits(kk));
   #UHat=reduced_param(U, bits(kk), bits(kk));
    
    sigma = diag(S);
    Pd=waterfill_No(sigma,P(ll),No);

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
  rate_actu=rate_actu/iter;
  rate_lb=rate_lb/iter;
  display([rate_actu,rate_lb]);
  fflush(stdout);
  rate_ratio(ll,:) = rate_actu./rate_lb;
end
figure;
plot(bits,rate_ratio,'-*','linewidth',1.5);
xlabel("Bits ");
ylabel("Rate ratio");
legend("different powers");
