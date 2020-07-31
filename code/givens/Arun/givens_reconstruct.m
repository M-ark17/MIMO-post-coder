function U = givens_reconstruct(phi_theta_vals)
  M = sqrt(length(phi_theta_vals));
  phi_vals = phi_theta_vals(1:(M*(M+1)/2));
  phi_vals = phi_vals(end:-1:1);
  theta_vals = phi_theta_vals(1+(M*(M+1)/2):end);
  theta_vals = theta_vals(end:-1:1);
  U = eye(M);
  for i=M:-1:1
      for j=M:-1:(i+1)
          G = eye(M);
          disp(theta_vals);
          theta = theta_vals(1);
          theta_vals = theta_vals(2:end);
          G([i j], [i j])  = [cos(theta) sin(theta);-sin(theta) cos(theta)];
          U = G'* U;
          disp(theta);
      end;
      i_complement = M - i + 1;
      phi_start = (i_complement * i_complement - i_complement) / 2 + 1;
      phi_end = phi_start + i_complement - 1;
      current_phi_vals = [zeros(1, i - 1) phi_vals(phi_end:-1:phi_start)];
      U = diag(exp(1j * current_phi_vals)) * U;
  end;
endfunction;
