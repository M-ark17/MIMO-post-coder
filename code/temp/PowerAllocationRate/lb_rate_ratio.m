clear all; close all; 
warning('off','all');
load "code_book2.mat"
addpath('../');
numerical_Qe_cal;
nu_func_file;
m = 4;
K=2; %no. of users with single antenna
P_dB = [0,10,20,30]; %total transmit power
p=10.^(P_dB/10);
No=1;
bits=[3:18];
bound= zeros(1,length(bits));
capacity= zeros(1,length(bits));
rate_iter = 50;
for mm = 1:length(p)
  P = p(mm)
  M = m;
  disp(["SNR is ", num2str(P)]);
 # disp(["bits " "  " "Achieved Rate" " " "Capacity " ]);
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
    bound(ll) = rate_lb_iter/rate_iter;
    capacity(ll) = rate_act_iter/rate_iter;
#    disp([bits(ll) rate_lb_iter rate_act_iter rate_lb_iter/rate_]);
  end
  bound .*= max(capacity)./capacity;
  capacity .*= max(capacity)./capacity;
  disp(["Rate Ratio:"]);
  [bits; bound; capacity; (bound./capacity)*100]'
  fflush(stdout);
#  bound .*= 0;
#  capacity .*= 0;
end 
