# load the code for theta
load ("code_book2.mat");
max_bits_per_param = 15;
Qe = zeros(2,2,max_bits_per_param);
for i = 1:max_bits_per_param
  expectation = zeros(2,2);
  quantisation_pts = cell2mat(theta_codes(2,1,i))*(pi/180);
  quantisation_levels = [0;cell2mat(theta_intervals(2,1,i));90]*(pi/180);
  for j = 1:length(quantisation_pts)
    gamma = quantisation_pts(j);
    cosxpgamma = @(theta) cos(theta-gamma)*sin(2*theta); # cos(theta-gamma)sin(2x)
    sinxmgamma = @(theta) sin(theta-gamma)*sin(2*theta);
    ecp = quad(cosxpgamma,quantisation_levels(j),quantisation_levels(j+1)); # integral of cos(theta-gamma)sin(2x)
    esm = quad(sinxmgamma,quantisation_levels(j),quantisation_levels(j+1));
    expectation += [ecp -esm;esm ecp];
  end
  expectation = expectation*(2^i)*sin(pi/2^i)/pi;
  expectation(2,2) *=(2^i)*sin(pi/2^i)/pi;
  Qe(:,:,i) = 2*eye(2)-expectation-expectation';
end

  
