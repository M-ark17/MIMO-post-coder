# load the code for theta
load ("code_book3.mat");
max_bits_per_param = 15;
Qe = zeros(3,3,max_bits_per_param);
for i = 1:max_bits_per_param
  expectation = zeros(3,3);
  tta1_q_pts = cell2mat(theta_codes(2,1,i))*(pi/180);
  tta2_q_pts = cell2mat(theta_codes(3,1,i))*(pi/180);
  tta3_q_pts = cell2mat(theta_codes(3,2,i))*(pi/180);
  tta1_q_levels = [0;cell2mat(theta_intervals(2,1,i));90]*(pi/180);
  tta2_q_levels = [0;cell2mat(theta_intervals(3,1,i));90]*(pi/180);
  tta3_q_levels = [0;cell2mat(theta_intervals(3,2,i));90]*(pi/180);
  sinc = (2^i)*sin(pi/2^i)/pi;
  for j = 1:length(tta1_q_pts)
    gamma1 = tta1_q_pts(j);
    gamma2 = tta2_q_pts(j);
    gamma3 = tta3_q_pts(j);
    cc = @(theta2) cos(gamma2)*cos(theta2);
    c = @(theta) cos(theta-gamma1); # cos(theta-gamma)
    ss = @(theta2) sin(gamma2)*sin(theta2);
    ss3 = @(theta3) sin(gamma3)*sin(theta3);
    cc3 = @(theta3) cos(gamma3)*cos(gamma3);
    ecc = quad(cc,tta2_q_levels(j),tta2_q_levels(j+1)); # integral of # cos(theta-gamma)sin(2x)
    ec = quad(c,tta1_q_levels(j),tta1_q_levels(j+1));
    ess = quad(ss,tta2_q_levels(j),tta2_q_levels(j+1));
    ess3 = quad(ss3,tta3_q_levels(j),tta2_q_levels(j+1));
    ecc3 = quad(cc3,tta3_q_levels(j),tta3_q_levels(j+1));
    expectation += [sinc*(ecc-ec*ess),0,0;
		    0, sinc^2*(ecc3*(ec*ecc-ess)+ess3*ec),0; 0,0,sinc^3*(ecc3*ec+ess3*(ec*ecc-ess))];
  end
  Qe(:,:,i) = 2*eye(3)-expectation-expectation';
end

  
