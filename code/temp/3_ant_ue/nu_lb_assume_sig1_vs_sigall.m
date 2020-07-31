clear all; close all; 
load "code_book3.mat"
addpath('../');
nu_func_file;
m = [10,100,1000]; %no. of transmit antanna
m = 10;
K = 3; % 3 antenna ue
P_dB = 10; %total transmit power
P = 10.^(P_dB/10);
No = 1;
iter = 300;
avg_iter = 100;
bits = [17:22];
c = zeros(K,1);
fmt = repmat('%d',10000,4); %for converting string to matrix with 4
			    %columns and rows as required.
for oo = 1:size(m,2)
  M = m(oo);
  disp(["For ",num2str(M)," transmit antennas % of capacity achieved "]);
  disp(["Bits "," sigma1, sigma2 "," Actual ","Bits " ,"    sigma1 ","Actual(1channel)"]);
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
    file = ["bits/bitsum" num2str(bits(ll)) ".csv"];
    bitCombs = cell2mat(textscan(fileread(file), fmt, 'Delimiter', ','));
    rate_actu = zeros(1,size(bitCombs,1));
    rate_actu1 = zeros(1,size(bitCombs,1));
    rate_lb_with_all_sigma = zeros(1,size(bitCombs,1));
    rate_lb_with_sigma1 = zeros(1,size(bitCombs,1));
    qe = zeros(3,3,size(bitCombs,1));
    for avg = 1:avg_iter
      h =(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
      [U S V] = svd(h,"econ");
      sigma = diag(S);
      Pd = waterfill_No(sigma,P,No);
      
      %%Rate with full CSIT and CSIR
      rate_ac = 0;
      rate_ac1 = 0;
      for i = 1:K
	rate_ac += real(log2(1+ (Pd(i) * (sigma(i)^2))/No)); 
      end
      rate_ac1 += log2(1+P*(sigma(1)^2/No));
      
      for kk = 1:size(bitCombs,1)
	rate_actu(kk) += rate_ac;
	rate_actu1(kk) += rate_ac1;
	bits_theta = [0, 0, 0; bitCombs(kk,2), 0, 0; bitCombs(kk,3), bitCombs(kk,4), 0];
	%%Finding lower bound
	if(avg == 1)
	  [Qe, ~, ~] = numerexpecq(bitCombs(kk,1), bits_theta, 20, 1);
	  qe(:,:,kk) = Qe;
	end
	rh=0;
	for i = 1:K
	  rh += log2(1+c(i)*qe(i,i,kk));
	end
	rate_low = rate_ac -rh;
	rate_lb_with_all_sigma(kk) += rate_low;
	rh = log2(1+c(1)*qe(1,1,kk));
	rate_low = rate_ac1 - rh;
	rate_lb_with_sigma1(kk) += rate_low;
      end
    end
    [all_sig, ind] = max(rate_lb_with_all_sigma);
    [sig1, ind1 ] = max(rate_lb_with_sigma1);
    disp([num2str(3*bitCombs(ind,1)+sum(bitCombs(ind,2:end))), "     ", num2str(all_sig/avg_iter), "    ", num2str(rate_actu(1)/avg_iter), "       ", num2str(2*bitCombs(ind,1)+sum(bitCombs(ind,2:3))), "        ", num2str(sig1/avg_iter),"   ", num2str(rate_actu1(1)/avg_iter)]);
    fflush(stdout);
  end
end  
