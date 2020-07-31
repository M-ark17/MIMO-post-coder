clear all; close all; 
warning('off','all');
load "code_book2.mat"
addpath('../');
numerical_Qe_cal;
nu_func_file;
M=10; %no. of transmit antanna
m = [2,4,6];
K=2; %no. of users with single antenna
P_dB = 10; %total transmit power
P=10.^(P_dB/10);
No=1;
bits=[3:18];
c=0;
rate_iter = 50;
for mm = 1:length(m)
  M = m(mm);
  disp(["Number of trasmit antennas = " num2str(M) " with number of receive antennas =  " num2str(K)]);
  disp(["bits " "  " "Achieved Rate" " " "Capacity " ]);
  for ll=1:length(bits)
    bitCombs = generatecombs(2,bits(ll));
    rate_act_iter = 0;
    rate_lb_iter = 0;
    for ii = 1:rate_iter
      h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
      [U S V] = svd(h,"econ");
      rate_actu=zeros(1,size(bitCombs,1));
      rate_lb=zeros(1,size(bitCombs,1));
      sigma = diag(S);
      lambda=lambdaPower(sigma,P,No);
      Plookup = getPower(K,M,lambda);      
      
      %%Rate with full CSIT and CSIR
      rate_ac=0;
      for i=1:K
        rate_ac = rate_ac+ real(log2(1+ (Plookup * (sigma(i)^2))/No)); 
      end

      for kk=1:size(bitCombs,1)
	rate_actu(kk) = rate_actu(kk)+rate_ac;
	%%Finding lower bound
	rate_low = rate_ac - real(K*log2(1+Plookup * sigma_lloyd_bound(K,bitCombs(kk,1),bitCombs(kk,2))/K));
	rate_lb(kk) = rate_lb(kk) + rate_low;
      end
      rate_lb_iter +=  max(rate_lb);
      rate_act_iter += max(rate_actu);
    end
    disp([bits(ll) rate_lb_iter/rate_iter rate_act_iter/rate_iter]);
    fflush(stdout);
  end
end 
