%Expectstion wrt U, is taken INSIDE the log to get avg Qe
%Expectation wrt sigma, is taken INSIDE the log 
%Quantisation simulation for 10x2 MIMO
%Assuming channel covariance is identity and is same for all users

clear all; close all; 
nu_func_file;
theoritical_Qe_cal;
numerical_Qe_cal;
M_all=[2, 4, 6]; %no. of transmit antanna
K=2; %no. of users with single antenna
P_dB = [0, 3, 6, 10]; %total transmit power
P_all=10.^(P_dB/10);
No=1;
iter=500;
bits=[1:15];
rate_actu=zeros(1,length(bits));
rate_lb=zeros(1,length(bits));
c=0;
for pp = 1:length(P_all)
  P = P_all(pp);
  for mm = 1:length(M_all)
    M = M_all(mm)
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
    
    iter=10;
    disp(["Power ", num2str(P), " dB with ", num2str(M), " transmit antennas"] )
    fflush(stdout)
    for ll=1:iter
      h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
      [U S V] = svd(h,"econ");
      for kk=1:length(bits)
	UHat=param(U, bits(kk), bits(kk));
			   #UHat=reduced_param(U, bits(kk), bits(kk));
	
	sigma = diag(S);
	Pd=waterfill_No(sigma,P,No);
	
	%%Rate with full CSIT and CSIR
	rate_ac=0;
	for i=1:K
	  rate_ac = rate_ac+ real(log2(1+ (Pd(i) * (sigma(i)^2))/No)); 
	end
	rate_actu(kk) = rate_actu(kk)+rate_ac;
	
	%%Finding lower bound
	rh=0;
	for i=1:K
	  rh= rh + log2(1+c*Qe(i,i,kk));
	end
	rate_low = rate_ac - rh;
	rate_lb(kk) = rate_lb(kk) + rate_low; 
      end
      disp(["iteration " num2str(ll) " remaining " num2str(500-ll)]);
      fflush(stdout)
    end
    
    rate_actu=rate_actu/iter;
    rate_lb=rate_lb/iter;
    fname = ["rate_for_P", num2str(P), "tx_ant", num2str(M),".mat"];
    save(fname, "rate_actu", "rate_lb");
  end
end
			   #figure;
			   #plot(bits,rate_actu,'-*','linewidth',1.5);
			   #hold on;
			   #plot(bits,rate_lb,'-*','linewidth',1.5);
                           #legend('Actual, Expectation inside log','Lower bound, Expectation inside log');
			   #title('Lower bound for 4x2 system');
