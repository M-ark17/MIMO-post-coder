clear all; close all; 
warning("off", "all");
nu_func_file;
addpath('../');
m = 2;
K = 2; % 2 antenna ue
P_dB = 10; %total transmit power
P = 10.^(P_dB/10);
No = 1;
avg_iter = 20;
bits = [2:20];
for oo = 1:size(m,2)
  M = m(oo);
  for ll=1:length(bits)
    
    bitCombs = generatecombs(2,bits(ll)); 
    rate_actu = 0;
    rate_actu1 = 0;
    all_sig = 0;
    one_sig = 0;
    ind = 0;
    ind1 = 0;
    for avg = 1:avg_iter
      rate_lb_with_all_sigma = zeros(1,size(bitCombs,1));
      rate_lb_with_one_sigma = zeros(1,size(bitCombs,1));
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
      rate_ac1 = real(log2(1+ (P * (sigma(1)^2))/No));
      
      for kk = 1:size(bitCombs,1)
	%%Finding lower bound
	rh = real(K*log2(1+Plookup*sigma_lloyd_bound(K,bitCombs(kk,1),bitCombs(kk,2:end))/K));
	rate_low = rate_ac -rh;
	rate_lb_with_all_sigma(kk) += rate_low;
	%%Finding lower bound if only one singular value is used
	rh1 = real(log2(1+P*sigma_lloyd_bound(K,bitCombs(kk,1),bitCombs(kk,2:end))));
	rate_low1 = rate_ac1 -rh1;
	rate_lb_with_one_sigma(kk) += rate_low1;
      end

      [tmp, tmp_ind] = max(rate_lb_with_all_sigma);
      all_sig += tmp;
      ind += tmp_ind;
      [tmp, tmp_ind] = max(rate_lb_with_one_sigma);
      one_sig += tmp;
      ind1 += tmp_ind;
      rate_actu += rate_ac;
      rate_actu1 += rate_ac1;
    end
    ind /= avg_iter;
    ind1 /= avg_iter;
    [num2str(bitCombs(ind,1)+bitCombs(ind,2)), "     ", num2str(all_sig/avg_iter), "    ", num2str(rate_actu/avg_iter), "     ", num2str(bitCombs(ind1,1)+sum(bitCombs(ind1,2:end))),"      ", num2str(one_sig/avg_iter), "     ", num2str(rate_actu1/avg_iter)] 
    fflush(stdout);
  end
end  
