
clear all; close all; 
load "code_book2.mat"
numerical_Qe_cal;
nu_func_file;
generateBitcombs;
m=[10,100,1000]; %no. of transmit antanna
M = 10;
K=2; %no. of users with single antenna
P=100:-10:10;
P = [P 9:-1:1];
No=1;
avg_iter = 100;
disp('Rate using no power control');
for oo = 1:size(P,2)
    rate_ac=0;
    for avg = 1:avg_iter
      h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
      [U S V] = svd(h,"econ");
      sigma = diag(S);
      Pd=waterfill_No(sigma,P(oo),No);
      
      %%Rate with full CSIT and CSIR
      for i=1:K
	rate_ac += real(log2(1+ (Pd(i) * (sigma(i)^2))/No)); 
      end
    end
    rate_ac /= avg_iter;
    disp([2*P(oo) rate_ac]);
    fflush(stdout);
end
x = [100:-10:10];
x = [x    9     8    6    4    2     1];
disp("Rate using power control");
data = dlmread('/home/mark/Documents/Academics/mtp/jpfeedback/plot_data/power_calculations_plot_values.data', ' ', 0, 0);
rate = [];
for i = 1:length(data)
  rate = [rate y_integral(data(i))];
end
disp([2*x',rate']);
