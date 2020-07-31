function [Qe,UHat,U] = numerexpecq(bits_phi, bits_theta, iter=300, variable_enabled=0)
  addpath('../');
  numerical_Qe_cal;
  K = 3;
  Qe = zeros(K,K);
  expec = zeros(K,K);
  for lii=1:iter
    UHat = eye([K,K]);
    U = generateU(K);
    [phi, theta, alpha, gamma, UHat] = params(U,bits_phi,bits_theta,variable_enabled);   
    B=UHat'*U-eye(K);
    Qe(:,:)=Qe(:,:)+B*B';
  end
  Qe=Qe./iter;
end

