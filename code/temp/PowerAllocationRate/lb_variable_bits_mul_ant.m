clear all; close all; 
load "code_book2.mat"
numerical_Qe_cal;
nu_func_file;
M=10; %no. of transmit antanna
m = [2,4,6];
K=2; %no. of users with single antenna
P_dB = 10; %total transmit power
P=10.^(P_dB/10);
No=1;
iter=500;
bits=[3:18];
c=0;
rate_iter = 600;
if(!exist("avg_rate_files_diff_ant", "dir"))
  mkdir "avg_rate_files_diff_ant";
end
for mm = 1:length(m)
  M = m(mm);
  for ll=1:iter
    h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
    [U S V] = svd(h,"econ");
    sigma = diag(S);
    lambda=lambdaPower(sigma,P,No);
    Plookup = getPower(K,M,lambda);      
    Pd = [Plookup Plookup];
    CC=S*diag(Pd)*S';
    CC=diag(CC);
    idx=randperm(K,1);
    c=c+CC(idx);
  end
  c=c/iter;
  
  for ll=1:length(bits)
    bitCombs = generatecombs(2,bits(ll));
    for ii = 1:rate_iter
      filename = ["avg_rate_files_diff_ant/p" num2str(P_dB) "ant" num2str(M) "bits" num2str(bits(ll)) "sum"	num2str(bits(ll)) "iterno" num2str(ii) ".mat"];
      if( exist (filename)) continue; end
      h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
      [U S V] = svd(h,"econ");
      rate_actu=zeros(1,size(bitCombs,1));
      rate_lb=zeros(1,size(bitCombs,1));
      sigma1only = 1;
      sigma = diag(S);
      lambda=lambdaPower(sigma,P,No);
      Plookup = getPower(K,M,lambda);      
      Pd = [Plookup Plookup];
      for kk=1:size(bitCombs,1)
	%%Rate with full CSIT and CSIR
	rate_ac=0;
	for i=1:K
          rate_ac = rate_ac+ real(log2(1+ (Pd(i) * (sigma(i)^2))/No)); 
	end
	rate_actu(kk) = rate_actu(kk)+rate_ac;
	
	%%Finding lower bound
	Qe = TheoryExpQe(bitCombs(kk,1),bitCombs(kk,2),theta_codes(2,1,bitCombs(kk,2)),theta_intervals(2,1,bitCombs(kk,2)));
	rh=0;
	for i=1:K
       	  rh= rh + log2(1+c*Qe(i,i));
	end
	rate_low = rate_ac - rh;
	rate_lb(kk) = rate_lb(kk) + rate_low; 
      end
      save(filename,"M", "bitCombs", "rate_lb", "rate_actu");
      disp([" bit iteration ", num2str(ll), " avg iteration ", num2str(ii)]);
      disp([rate_lb;rate_actu]);
      fflush(stdout);
    end
  end
end 
