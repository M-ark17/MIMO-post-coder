clear all; close all; 
warning('off','all');
pkg load symbolic
function [P] = getPower(r,t,lambda)
  syms k;
  syms y;
  assume y positive;
  syms sig;
  eqn =r*int((1/y - 1/sig)*symsum((factorial(k)/factorial(k+t-r))*laguerreL(k,t-r,sig)^2*sig^(t-r)*exp(-sig),k,0,r-1)/r,sig,[y,inf]);
  P = double(subs(eqn,y,lambda));
end
M=10; %no. of transmit antanna
m = [20,40,60];
K=4; %no. of users with single antenna
P_dB = 10; %total transmit power
P=10.^(P_dB/10);
No=1;
rate_iter = 50;
for mm = 1:length(m)
  M = m(mm);
  disp(["Number of trasmit antennas = " num2str(M) " with number of receive antennas =  " num2str(K)]);
  disp([ "  " "New strategy Rate" " " "Equal power Rate " ]);
  rate_lookup_iter = 0;
  rate_equal_power_iter = 0;
  rate_waterfill_iter = 0;
  for ii = 1:rate_iter
    h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
    [U S V] = svd(h,"econ");
    sigma = diag(S);
    lambda=lambdaPower(sigma,P,No);
    Plookup = getPower(K,M,lambda);      
    Pwaterfill = waterfill_No(sigma,P,No);
    %%Rate with full CSIT and CSIR
    rate_lookup=0;
    rate_equal_power=0;
    rate_waterfill_power=0;
    for i=1:K
      rate_lookup = rate_lookup+ real(log2(1+ (Plookup * (sigma(i)^2))/No)); 
      rate_equal_power = rate_equal_power+ real(log2(1+ (P * sigma(i)^2)/(No*K))); 
      rate_waterfill_power = rate_waterfill_power+ real(log2(1+ (Pwaterfill(i) * sigma(i)^2)/(No*K))); 
    end
    
    rate_lookup_iter += rate_lookup;
    rate_equal_power_iter += rate_equal_power;
    rate_waterfill_iter += rate_waterfill_power;
  end
  disp([rate_lookup_iter/rate_iter rate_equal_power_iter/rate_iter, rate_waterfill_iter/rate_iter]);
  fflush(stdout);
end 
