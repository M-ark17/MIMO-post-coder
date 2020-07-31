%Frobenius Norm calculation for checking
%Quantisation simulation for 10x2 MIMO
%Assuming channel covariance is identity and is same for all users

clear all; close all; clc;
nu_func_file;
nu_func_file_multi;
M=10; %no. of transmit antanna
K=2; %no. of users with single antenna
P = 10; %total transmit power
%No=0.1;
iter=1000;

bits=12;

%%%%%%%%Rate Calculation%%%%
P_dB = [0:2:20];
P=10.^(P_dB/10);
rate = zeros(1,length(P));


h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
[U S V] = svd(h,"econ");
UHat=param(U,bits);
U_worst=param_multi(U,bits);
n_rw=size(U_worst,1);

UHat_w=zeros(n_rw,2); 
D1=zeros(n_rw,2); 
D2=zeros(n_rw,2);
dist1=zeros(1,n_rw/K); 
dist2=zeros(1,n_rw/K); 
for i=1:(n_rw/K)
  UHat_w(2*i-1:2*i,:)=param(U_worst(2*i-1:2*i,:),bits);
  D1(2*i-1:2*i,:)= UHat_w(2*i-1:2*i,:)-U_worst(2*i-1:2*i,:);
  D2(2*i-1:2*i,:)= UHat-U_worst(2*i-1:2*i,:);
%  dist1(i)=sqrt(trace(D1(2*i-1:2*i,:)*D1(2*i-1:2*i,:)'));
%  dist2(i)=sqrt(trace(D2(2*i-1:2*i,:)*D2(2*i-1:2*i,:)'));
  dist1(i)=norm(D1(2*i-1:2*i,:), 'fro');
  dist2(i)=norm(D2(2*i-1:2*i,:), 'fro');
end  


%disp("Distance between 16 worst matrices and its corresponding quantised");
%disp(dist1);
%disp("\nDistance between 16 worst matrices and original quantised");
%disp(dist2);

figure;
plot(dist1,'-*','linewidth',1.5);
hold on;
plot(dist2,'-*','linewidth',1.5);
legend('With corresponding quantised', 'With original quantised');
