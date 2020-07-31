clear all; close all; 
load "code_book2.mat"
numerical_Qe_cal;
#nu_func_file;
#generateBitcombs;
M=10; %no. of transmit antanna
K=2; %no. of users with single antenna
P_dB = 10; %total transmit power
P=10.^(P_dB/10);
No=1;
iter=500;
bits=[1:15];
c=0;
phi_bits = 7;

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

for ll=1:1
  h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
  [U S V] = svd(h,"econ");
  rate_actu=zeros(1,length(bits));
  rate_lb=zeros(1,length(bits));
  for kk=1:length(bits)
    sigma = diag(S);
    Pd=waterfill_No(sigma,P,No);

    %%Rate with full CSIT and CSIR
    rate_ac=0;
    for i=1:K
      rate_ac = rate_ac+ real(log2(1+ (Pd(i) * (sigma(i)^2))/No)); 
    end
    rate_actu(kk) = rate_actu(kk)+rate_ac;
    Qe = TheoryExpQe(phi_bits,kk,theta_codes(2,1,kk),theta_intervals(2,1,kk));

    %%Finding lower bound
    rh=0;
#    c = covSigma(bitCombs(kk,1),bitCombs(kk,2),M,K,P,No,100);
    for i=1:K
      rh= rh + log2(1+c*Qe(i,i));
    end
    rate_low = rate_ac - rh;
    rate_lb(kk) = rate_lb(kk) + rate_low; 
    disp(["iteration ",num2str(kk)]);
    disp([rate_lb;rate_actu]);
    fflush(stdout);
  end
end
plot(bits,rate_lb);
hold on;plot(bits,rate_actu);hold off;
xlabel("number of bits for theta");ylabel("rate");title("Lower bound when each phi is given 7 bits and theta varies from 1:15");
legend("actual rate","Lower bound");
