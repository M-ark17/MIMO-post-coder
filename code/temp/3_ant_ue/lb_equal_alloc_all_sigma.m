clear all; close all; 
load "code_book3.mat"
load "Q.mat"
addpath('../');
nu_func_file;
m = [3, 6, 9]; %no. of transmit antanna
%m = 1000;
K = 3; % 3 antenna ue
P_dB = [0, 3, 6, 10]; %total transmit power
P_all = 10.^(P_dB/10);
No = 1;
iter = 300;
avg_iter = 1000;
bits = [1:14];
c = zeros(K,1);
qe = Qe3;

for pp = 1:length(P_all)
  P = P_all(pp);
  for oo = 1:size(m,2)
    M = m(oo);
    disp(["For ",num2str(M)," transmit antennas", num2str(P),"Power "]);
    disp(["Bits "," Actual ","Bits "]);
    fflush(stdout);
    for ll=1:iter
      h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
      [U S V] = svd(h,"econ");
      sigma = diag(S);
      Pd = waterfill_No(sigma,P,No);
      CC = S*diag(Pd)*S';
      CC = diag(CC);
      c += CC;
    end
    c = c/iter;
    
    for ll=1:length(bits)
      bitCombs = [bits(ll),bits(ll),bits(ll),bits(ll)];
      rate_actu = zeros(1,size(bitCombs,1));
      rate_lb_with_all_sigma = zeros(1,size(bitCombs,1));
				%    qe = zeros(3,3,size(bitCombs,1));
      for avg = 1:avg_iter
	h =(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
	[U S V] = svd(h,"econ");
	sigma = diag(S);
	Pd = waterfill_No(sigma,P,No);
	
	%%Rate with full CSIT and CSIR
	rate_ac = 0;
	for i = 1:K
	  rate_ac += real(log2(1+ (Pd(i) * (sigma(i)^2))/No)); 
	end
	
	for kk = 1:size(bitCombs,1)
	  rate_actu(kk) += rate_ac;
	  bits_theta = [0, 0, 0; bitCombs(kk,2), 0, 0; bitCombs(kk,3), bitCombs(kk,4), 0];
	  rh=0;
	  for i = 1:K
	    rh += log2(1+c(i)*qe(i,i,bitCombs(kk,1)));
	  end
	  rate_low = rate_ac -rh;
	  rate_lb_with_all_sigma(kk) += rate_low;
	end
      end
      [all_sig, ind] = max(rate_lb_with_all_sigma);
      disp([num2str(3*bitCombs(ind,1)+sum(bitCombs(ind,2:end))), "     ", num2str(all_sig/avg_iter), "    ", num2str(rate_actu(1)/avg_iter)]);
      fflush(stdout);
    end
  end  
end
