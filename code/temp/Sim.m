%Quantisation simulation for 10x2 MIMO
%Assuming channel covariance is identity and is same for all users

clear all; close all; clc;
M=10; %no. of transmit antanna
K=2; %no. of users with single antenna
P = 10; %total transmit power
No=0.1;
iter=1000;

C=zeros(K,K);

for i=1:iter
%Identity channel covariance
h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
[U S VH] = svd(h);

%Like quantised channel
h_Hat=h+ (randn(K,M) + 1j * randn(K,M))*sqrt(No/2);
[U_Hat S_Hat VH_Hat] = svd(h);

%d=waterfill(svd(h),P)';
d=waterfill(ones(1,M),P)'; %What is alpha here
%Precoding transmit vector
x=VH'*d;

%At the receiver 
w=(randn(K,1) + 1j * randn(K,1))*sqrt(No/2);
y=h*x + w;

y_Hat = U_Hat'*y;

%To find the covariance
yy=y_Hat-S*d;
Cyy=yy*yy';
C=C + (Cyy-eye(K));
end

C=C./iter;  %Required covariance matrix obtained after averaging