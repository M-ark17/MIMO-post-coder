clear all; close all; 
load "code_book3.mat"
warning("off", "all");
nu_func_file;
addpath('../');
m = 9;
#m = [3, 6, 9]; %no. of transmit antanna
K = 3; % 3 antenna ue
P_dB = 10; %total transmit power
P = 10.^(P_dB/10);
No = 1;
avg_iter = 100;
bits = [25:-1:4];
c = zeros(K,1);
for oo = 1:size(m,2)
  M = m(oo);
  for ll=1:length(bits)
    
    bitCombs = generate4combs(bits(ll)); 
    rate_actu = 0;
    all_sig = 0;
    ind = 0;
    rate_act = 0;
    for avg = 1:avg_iter
      rate_lb_with_all_sigma = zeros(1,size(bitCombs,1));
      h =(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
      [U S V] = svd(h,"econ");
      sigma = diag(S);
      lambda = lambdaPower(sigma,P,No);
      Plookup = getPower(K,M,lambda);
      Pd = Plookup*ones(1,K);
      
      %%Rate with full CSIT and CSIR
      rate_ac = 0;
      for i = 1:K
	rate_ac += real(log2(1+ (Pd(i) * (sigma(i)^2))/No)); 
      end
      rate_actu += rate_ac;
      
      for kk = 1:size(bitCombs,1)
	%%Finding lower bound
	rh = real(K*log2(1+Plookup*sigma_lloyd_bound_r(K,bitCombs(kk,1),bitCombs(kk,2:end))/K));
	rate_low = rate_ac -rh;
	rate_lb_with_all_sigma(kk) += rate_low;
      end
      [tmp, tmp_ind] = max(rate_lb_with_all_sigma);
      all_sig += tmp;
      ind += tmp_ind;
      rate_act += rate_ac;
    end
    ind /= avg_iter;
    disp([num2str(3*bitCombs(ind,1)+2*bitCombs(ind,2)+bitCombs(ind,3)), "     ", num2str(all_sig/avg_iter), "    ", num2str(rate_act/avg_iter)]);
#    disp([num2str(3*bitCombs(ind,1)+2*bitCombs(ind,2)+bitCombs(ind,3))]);
#    disp([num2str(bitCombs(ind,1)) num2str(bitCombs(ind,2)) num2str(bitCombs(ind,3))]);
    fflush(stdout);
  end
end  
