%Expectation is taken INSIDE the log  
%Quantisation simulation for 10x2 MIMO
%Assuming channel covariance is identity and is same for all users
%Using NEW FILE METHOD

clear all; close all; clc;
nu_func_file;
%nu_func_file_multi;
new_file;
test_distance;

M=10; %no. of transmit antanna
K=2; %no. of users with single antenna
P_dB = 10; %total transmit power
P=10.^(P_dB/10);
No=1;
iter=100;

bits=[1:5];
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

iter=1;
 for ll=1:iter
 h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
 [U S V] = svd(h,"econ");
 for kk=1:length(bits)
 disp(kk);
 fflush(stdout);
 UHat=param(U,bits(kk));
 %UHat=reduced_param(U,bits(kk));
 %U_worst=param_multi(U,bits(kk));
 [v_all, d] = code_book_u(kk);
 B=test_dist(v_all);
 
 sigma = diag(S);
 Pd=waterfill_No(sigma,P,No);
 %%Rate with full CSIT and CSIR
 rate_ac=0;
 for i=1:K
  rate_ac = rate_ac+ real(log2(1+ (Pd(i) * (sigma(i)^2))/No)); 
 end
 rate_actu(kk) = rate_actu(kk)+rate_ac;
 
 %%Finding lower bound
 Qe= B'*B;
 rh=0;
 for i=1:K
   rh= rh + log2(1+c*Qe(i,i));
 end
 rate_low = rate_ac - rh;
 rate_lb(kk) = rate_lb(kk) + rate_low; 
 end
 
 end
 
 rate_actu=rate_actu/iter;
 rate_lb=rate_lb/iter;
 
 plot(bits,rate_actu,'-*','linewidth',1.5);
 hold on;
 plot(bits,rate_lb,'-*','linewidth',1.5);
 legend('Actual, Expectation inside log','Lower bound, Expectation inside log');
