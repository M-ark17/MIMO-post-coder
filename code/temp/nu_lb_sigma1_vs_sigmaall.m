
clear all; close all; 
load "code_book2.mat"
numerical_Qe_cal;
nu_func_file;
M=10; %no. of transmit antanna
K=2; %no. of users with single antenna
P_dB = 10; %total transmit power
P=10.^(P_dB/10);
No=1;
iter=500;
rate_iter = 50;
bits=[18:-1:4];
bits=[4:18];
sigma1only = 1;
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

for ll=1:length(bits)
  bitCombs_all = generate4combs(bits(ll));
  bitCombs_sigma1 = generatecombs(3,bits(ll));
  #for ii = rate_iter:-1:1
  for ii = 1:rate_iter
    filename = ["avg_rate_files_sigma1vssigma2/p" num2str(P_dB) "bits" num2str(bits(ll)) "sumigma1vssigma2_" num2str(bits(ll)) "iterno_" num2str(ii) ".mat"];
    if (exist (filename)) 
      disp(["bit iteration ",num2str(bits(ll)),"avg iteration ", num2str(ii)]);
      fflush(stdout);
      continue;
    end
    h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
    [U S V] = svd(h,"econ");
    sigma = diag(S);
    Pd=waterfill_No(sigma,P,No);
    
    %%Rate with full CSIT and CSIR
    rate_ac=0;
    for i=1:K
      rate_ac = rate_ac+ real(log2(1+ (Pd(i) * (sigma(i)^2))/No)); 
    end

    rate_actu=zeros(1,size(bitCombs_all,1));
    rate_lb_with_all_sigma=zeros(1,size(bitCombs_all,1));
    
    for kk=1:size(bitCombs_all,1)
      rate_actu(kk) = rate_actu(kk)+rate_ac;
      %%Finding lower bound
      Qe = TheoryExpQe(bitCombs_all(kk,3),bitCombs_all(kk,4),theta_codes(2,1,bitCombs_all(kk,4)),theta_intervals(2,1,bitCombs_all(kk,4)));
      c = covSigma(bitCombs_all(kk,1),bitCombs_all(kk,2),M,K,P,No,100);
      rh=0;
      for i=1:K
 	rh= rh + log2(1+c*Qe(i,i));
      end
      rate_low = rate_ac -rh;
      rate_lb_with_all_sigma(kk) = rate_lb_with_all_sigma(kk)+rate_low;
    end
    
    rate_lb_with_sigma1=zeros(1,length(bitCombs_sigma1));
    
    for kk = 1:size(bitCombs_sigma1,1)
      Qe =TheoryExpQe(bitCombs_sigma1(kk,2),bitCombs_sigma1(kk,3),theta_codes(2,1,bitCombs_sigma1(kk,3)),theta_intervals(2,1,bitCombs_sigma1(kk,3)),sigma1only);
      c = covSigma(bitCombs_sigma1(kk,1),0,M,K,P,No,iter);
      rh = log2(1+c*Qe);
      rate_low = rate_ac - rh;
      rate_lb_with_sigma1(kk) = rate_lb_with_sigma1(kk) + rate_low;
    end
    
    save(filename,"bitCombs_all","bitCombs_sigma1","rate_lb_with_all_sigma","rate_lb_with_sigma1","rate_actu");
    disp(["bit iteration ",num2str(bits(ll)),"avg iteration ", num2str(ii)]);
    #disp(rate_lb_with_all_sigma);
    #disp([rate_lb_with_sigma1;rate_actu]);
    fflush(stdout);
  end
end
 
