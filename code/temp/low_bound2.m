%Expectation is taken INSIDE the log  
%Quantisation simulation for 10x2 MIMO
%Assuming channel covariance is identity and is same for all users

clear all; close all; clc;
nu_func_file;
nu_func_file_multi;
M=10; %no. of transmit antanna
K=2; %no. of users with single antenna
P_dB = 10; %total transmit power
P=10.^(P_dB/10);
No=1;
iter=100;

bits=[1:15];
rate_actu=zeros(1,length(bits));
rate_lb=zeros(1,length(bits));

c=0;
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

iter=1;
 for ll=1:iter
 h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
 [U S V] = svd(h,"econ");
 for kk=1:length(bits)
 UHat=param(U,bits(kk));
 %UHat=reduced_param(U,bits(kk));
 U_worst=param_multi(U,bits(kk));
 %U_w=U_worst(1:K,:);  %Taking 1st matrix randomly
 n_rw=size(U_worst,1);

 %UHat_w=zeros(n_rw,2); 
 A=zeros(n_rw,K); 
 A_norm=zeros(n_rw/K,1); %worst U_worst is the one with largest A_norm
 for i=1:(n_rw/K)
  %UHat_w(2*i-1:2*i,:)=param(U_worst(2*i-1:2*i,:),bits);
  A(2*i-1:2*i,:)=UHat'*U_worst(2*i-1:2*i,:)-eye(K);
  A_norm(i)=norm(A(2*i-1:2*i,:)*A(2*i-1:2*i,:)','fro');
 end  

 %disp(A_norm');
 [norm_Aw, ind_Aw] = max (A_norm);
 B= A(K*ind_Aw-K+1:K*ind_Aw,:);  %The worst possible B
 
 sigma = diag(S);
 Pd=waterfill_No(sigma,P,No);
 %%Rate with full CSIT and CSIR
 rate_ac=0;
 for i=1:K
  rate_ac = rate_ac+ real(log2(1+ (Pd(i) * (sigma(i)^2))/No)); 
 end
 rate_actu(kk) = rate_actu(kk)+rate_ac;
 
 %%Finding lower bound
 Qe= B'*B;
 rh=0;
 for i=1:K
   rh= rh + log2(1+c*Qe(i,i));
 end
 rate_low = rate_ac - rh;
 rate_lb(kk) = rate_lb(kk) + rate_low; 
 end
 
 end
 
 rate_actu=rate_actu/iter;
 rate_lb=rate_lb/iter;
 
 plot(bits,rate_actu,'-*','linewidth',1.5);
 hold on;
 plot(bits,rate_lb,'-*','linewidth',1.5);
 legend('Actual, Expectation inside log','Lower bound, Expectation inside log');
