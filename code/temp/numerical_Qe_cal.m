nu_func_file;
function [U] = generateU(m = 2)
    row = m;col = m;
    if(m == 2)
        phi1 = rand(1)*2*pi;
        phi2 = rand(1)*2*pi;
        phi3 = rand(1)*2*pi;
        phi = [phi1, phi2; 0, phi3]';
        theta =[0,asin(1-rand(1))^0.5;0,0]';
    else
      phi = [rand(1)*2*pi,0,0;rand(1)*2*pi,rand(1)*2*pi,0;rand(1)*2*pi,rand(1)*2*pi,rand(1)*2*pi];
      theta = [0,0,0;asin(1-rand(1))^0.5,0,0;asin(1-rand(1))^0.25,asin(1-rand(1))^0.5,0];
    end
    U = eye([row,col]);
    for j = 1:row
      cv = reconstruction(phi(j:end,j),theta(:,j),j);
      U *= cv;
    end
end

function [Qe] = TheoryExpQe(bits_phi, bits_theta, theta_codes, theta_intervals, onlysigma1 = 0)
#  load ("code_book2.mat");   
  quantisation_pts = cell2mat(theta_codes)*(pi/180);
  quantisation_levels = [0;cell2mat(theta_intervals);90]*(pi/180);
  Expecphi = (2^bits_phi)*sin(pi/2^bits_phi)/pi;
  if(onlysigma1)
    expectation = 0;
    for j = 1:length(quantisation_pts)
      gamma = quantisation_pts(j);
      cosxpgamma = @(theta) cos(theta-gamma)*sin(2*theta); # cos(theta-gamma)sin(2x)                                               
      expectation += quad(cosxpgamma,quantisation_levels(j),quantisation_levels(j+1)); # integral of cos(theta-gamma)sin(2x) 
    end
    Qe = 2 - Expecphi*expectation -(Expecphi*expectation)'; 
  else
    Qe = zeros(2,2);
    expectation = zeros(2,2);
    for j = 1:length(quantisation_pts)
      gamma = quantisation_pts(j);
      cosxpgamma = @(theta) cos(theta-gamma)*sin(2*theta); # cos(theta-gamma)sin(2x)                                               
      sinxmgamma = @(theta) sin(theta-gamma)*sin(2*theta);
      ecp = quad(cosxpgamma,quantisation_levels(j),quantisation_levels(j+1)); # integral of cos(theta-gamma)sin(2x) 
      esm = quad(sinxmgamma,quantisation_levels(j),quantisation_levels(j+1));
      expectation += [ecp -esm;esm ecp];
    end
    expectation = expectation*Expecphi;
    expectation(2,2) *= Expecphi;
    Qe = 2*eye(2)-expectation-expectation';
  end
end

function [Qe] = numerExpecQe(bits_phi, bits_theta, iter=300, phi1Decision = 0)
  K = 2;
  Qe = zeros(K,K);
  expec = zeros(K,K);
  for ll=1:iter
    U = generateU();
    [phi, theta, alpha, gamma, ~] = params(U,bits_phi,bits_theta);   
    phi = [phi(1,1) phi(2,1) phi(2,2)];
    theta = theta(2,1);
    gamma = gamma(2,1);
    alpha = [alpha(1,1) alpha(2,1) alpha(2,2)];
    theta *= pi/180;
    gamma *= pi/180;
    if(phi1Decision == 1)
      phi(1) = 0;
      alpha(1) = 0;
    end
    phmal = phi-alpha;
    expec11 = exp(1j*phmal(2))*sin(theta)*sin(gamma)+exp(1j*phmal(1))*cos(theta)*cos(gamma)-1; 
    expec12 = exp(1j*(phi(3)+phmal(1)))*sin(theta)*cos(gamma)-exp(1j*(phmal(2)+phi(3)))*cos(theta)*sin(gamma);
    expec21 = exp(1j*(phmal(1)-alpha(3)))*cos(theta)*sin(gamma)-exp(1j*(phmal(2)-alpha(3)))*sin(theta)*cos(gamma);
    expec22 = exp(1j*(phmal(1)+phmal(3)))*sin(theta)*sin(gamma)+exp(1j*(phmal(2)+phmal(3)))*cos(theta)*cos(gamma)-1;
    c = [expec11 expec12; expec21 expec22];
    expec(:,:) += c'*c;
    UHat=param(U,bits_phi,bits_theta);
    B=UHat'*U-eye(K);
    Qe(:,:)=Qe(:,:)+B*B';
  end
  expec /= iter;
  Qe=Qe./iter;
end

function [c] = covSigma(sigma_bits1,sigma_bits2,M,K,P,No=1,iter = 100)
  sigma_bits = [sigma_bits1,sigma_bits2];
  c = 0;
  meansigma = 0;
  for ll=1:iter
    h=(randn(K,M) + 1j * randn(K,M)) / sqrt(2);  %Rayleih fading                                                                    
    [U S V] = svd(h,"econ");
    s = diag(S);
    sigma = quant_singular(s,sigma_bits);
    if(sigma_bits2 == 0)
      c = c+sigma(1)*sigma(1)';
      meansigma += sigma(1);
    else
      Pd=waterfill_No(sigma,P,No);
      idx=randperm(K,1);
      CC=diag(sigma)*diag(Pd)*diag(sigma)';
      CC=diag(CC);
      c=c+CC(idx);
    end
  end
  if(sigma_bits2 == 0)
    c = c/iter - (meansigma/iter)^2;
    c *= P;
    #c = (P*c)/iter ;
  else
    c = c/iter;
  end
end
