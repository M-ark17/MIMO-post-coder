clear all; close all; 
load "code_book2.mat"
numerical_Qe_cal;
nu_func_file;
m=[10,100,1000]; %no. of transmit antanna
%m = 1000;
K=2; %no. of users with single antenna
P_dB = 10; %total transmit power
P=10.^(P_dB/10);
No=1;
iter=2000;
avg_iter = 100;
bits=[18:-1:4];
bits=[3:12];
sigma1only = 1; %keep this as 1 for sigma1 only vs sigmaall case
c=zeros(K,1);
for oo = 1:size(m,2)
  M= m(oo);
  disp(["For ",num2str(M)," transmit antennas % of capacity achieved "]);
  disp(["Bits "," sigma1, sigma2 "," Actual ","Bits " ,"    sigma1 ","Actual(1channel)"]);
%  disp(["Bits ","  2 channels ", " Bits "," 1 channel "]);
  fflush(stdout);
  for ll=1:iter
    h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
    [U S V] = svd(h,"econ");
    sigma = diag(S);
    Pd=waterfill_No(sigma,P,No);
    CC=S*diag(Pd)*S';
    CC=diag(CC);
    c+=CC;
  end
  c=c/iter;
  
  for ll=1:length(bits)
    bitCombs= generatecombs(2,bits(ll));
    rate_actu=zeros(1,size(bitCombs,1));
    rate_actu1=zeros(1,size(bitCombs,1));
    rate_lb_with_all_sigma=zeros(1,size(bitCombs,1));
    rate_lb_with_sigma1=zeros(1,size(bitCombs,1));
    for avg = 1:avg_iter
      h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
      [U S V] = svd(h,"econ");
      sigma = diag(S);
      Pd=waterfill_No(sigma,P,No);
      
      %%Rate with full CSIT and CSIR
      rate_ac=0;
      rate_ac1=0;
      for i=1:K
	rate_ac += real(log2(1+ (Pd(i) * (sigma(i)^2))/No)); 
      end
      rate_ac1 += log2(1+P*(sigma(1)^2/No));
      
      for kk=1:size(bitCombs,1)
	rate_actu(kk) += rate_ac;
	rate_actu1(kk) += rate_ac1;
	%%Finding lower bound
	Qe = TheoryExpQe(bitCombs(kk,1),bitCombs(kk,2),theta_codes(2,1,bitCombs(kk,1)),theta_intervals(2,1,bitCombs(kk,1)));
	rh=0;
	for i=1:K
	  rh += log2(1+c(i)*Qe(i,i));
	end
	rate_low = rate_ac -rh;
	rate_lb_with_all_sigma(kk) += rate_low;
	%Qe = TheoryExpQe(bitCombs(kk,1),bitCombs(kk,2),
	%		 theta_codes(2,1,bitCombs(kk,1)),
	%		 theta_intervals(2,1,bitCombs(kk,1)),
	%		 sigma1only);
	rh = log2(1+c(1)*Qe(1,1));
	rate_low = rate_ac1 - rh;
	rate_lb_with_sigma1(kk) += rate_low;
      end
    end
    [all_sig, ind] = max(rate_lb_with_all_sigma);
    [sig1, ind1 ] =max(rate_lb_with_sigma1);
    %disp([num2str(2*bitCombs(ind,1)+bitCombs(ind,2)), "     ", num2str(all_sig/rate_actu(1)), "       " ,num2str(bitCombs(ind,1)+bitCombs(ind,2)), "        ", num2str(sig1/rate_actu1(1))]);
    disp([num2str(bitCombs(ind,1)+bitCombs(ind,2)), "     ", num2str(all_sig/avg_iter), "    ", num2str(rate_actu(1)/avg_iter), "       ", num2str(bitCombs(ind,1)+bitCombs(ind,2)), "        ", num2str(sig1/avg_iter),"   ", num2str(rate_actu1(1)/avg_iter)]);
    fflush(stdout);
  end
end  
