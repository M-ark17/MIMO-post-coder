%Expectation wrt U, is taken INSIDE the log to get avg Qe
%Expectation wrt sigma, is taken INSIDE the log 
%Quantisation simulation for 10x2 MIMO
%Assuming channel covariance is identity and is same for all users

clear all; close all; 
addpath('../');
numerical_Qe_cal;
M=10; %no. of transmit antanna
K=3; %no. of users with single antenna
P_dB = 10; %total transmit power
P=10.^(P_dB/10);
No=1;
iter=50;
bits=[1:14];
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
function [Qe] = expecQ(bits_phi, bits_theta, iter = 300)
  Qe = 0;
  for i = 1:iter
    phi1 = (2*rand(1)-1)*pi;
    phi2 = (2*rand(1)-1)*pi;
    phi3 = (2*rand(1)-1)*pi;
    phi4 = (2*rand(1)-1)*pi;
    phi5 = (2*rand(1)-1)*pi;
    phi6 = (2*rand(1)-1)*pi;
    phi = [phi1,0,0;phi2,phi4,0;phi3,phi5,phi6];
    theta1 = asin(1-rand(1))^0.5;
    theta2 = asin(1-rand(1))^0.25;
    theta3 = asin(1-rand(1))^0.5;
    theta = [0,0,0;theta1,0,0;theta2,theta3,0];
    alpha = quantize(phi,bits_phi);
    gamma = quantize_theta(theta,bits_theta);
    D1 = diag(exp(1j*[phi1,phi2,phi3]));
    G1 = [1,0,0;0,cos(theta1),sin(theta1);0,-sin(theta1),cos(theta1)];
    G2 = [cos(theta2),sin(theta2),0;-sin(theta2),cos(theta2),0;0,0,1];
    D2 = diag(exp(1j*[phi3,phi4,phi5]));
    D2(1,1) = 1;
    G3 = [1,0,0;0,cos(theta3),sin(theta3);0,-sin(theta3),cos(theta3)];
    D3 = [1,0,0;0,1,0;0,0,exp(1j*phi6)];
    D1h = diag(exp(1j*[alpha(1,1),alpha(2,1),alpha(3,1)]));
    G1h = [1,0,0;0,cos(gamma(2,1)),sin(gamma(2,1));0,-sin(gamma(2,1)),cos(gamma(2,1))];
    G2h = [cos(gamma(3,1)),sin(gamma(3,1)),0;-sin(gamma(3,1)),cos(gamma(3,1)),0;0,0,1];
    D2h = diag(exp(1j*[phi3,alpha(2,2),alpha(3,2)]));
    D2h(1,1) = 1;
    G3h = [1,0,0;0,cos(gamma(3,2)),sin(gamma(3,2));0,-sin(gamma(3,2)),cos(gamma(3,2))];
    D3h = [1,0,0;0,1,0;0,0,exp(1j*alpha(3,3))];
    E1 = norm(D1-D1h,'fro');
    E2 = norm(D2-D2h,'fro');
    E3 = norm(D3-D3h,'fro');
    E4 = norm(G1-G1h,'fro');
    E5 = norm(G2-G2h,'fro');
    E6 = norm(G3-G3h,'fro');
    Qe += E1^2+E2^2+E3^2+E4^2+E5^2+E6^2;
  end
  Qe /= iter;
end
  
function [Qe] = numerExpecQ(bits_phi, bits_theta, iter=300)
  K = 3;
  Qe = zeros(K,K);
  expec = zeros(K,K);
  for lii=1:iter
    UHat = eye([K,K]);
    U = generateU(K);
    [phi, theta, alpha, gamma, ~] = params(U,bits_phi,bits_theta);   
%    theta .*= pi/180;
%    gamma .*= pi/180;
    %gamma = quantize(theta,bits_theta);
    disp("using code book ");
    for lee = 1:K
      UH = reconstruction(alpha(lee:end,lee),gamma(:,lee),lee);
      UHat *= UH;
    end
    B=UHat'*U-eye(K);
    Qe(:,:)=Qe(:,:)+B*B';
  end
  Qe=Qe./iter;
end

iter=500;
load "Q.mat";
Q = Qe3;
for ll=1:iter
  h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading
  [U S V] = svd(h,"econ");
  for kk=1:length(bits)
    %if(ll == 1)
    %  Q(:,:,bits(kk)) = expecQ(bits(kk), bits(kk), 500);
    %end
    
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
      rh= rh + log2(1+c*Q(i,i,kk));
    end
    rate_low = rate_ac - rh;
    rate_lb(kk) = rate_lb(kk) + rate_low; 
  end
  disp(["iteration " num2str(ll) " remaining " num2str(iter-ll) ]);
  fflush(stdout);
end
 
rate_actu=rate_actu/iter;
rate_lb=rate_lb/iter;
figure;
plot(bits,rate_actu,'-*','linewidth',1.5);
hold on;
plot(bits,rate_lb,'-*','linewidth',1.5);
legend('Actual, Expectation inside log','Lower bound, Expectation inside log');
title('Expectation wrt sigma is taken INSIDE log & Expectation wrt U is taken INSIDE log');
