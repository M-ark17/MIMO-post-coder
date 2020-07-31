pkg load communications;
pkg load miscellaneous;
iterations = 1000000;
m = 2;
max_bits = 15;
sigmas = zeros(m,1,iterations);
for i =1:iterations
  h = randn(m)+1j*randn(m);
  [u,s,v] = svd(h);
  sigmas(:,:,i) = diag(s);
end

function [out] = get_hermite_mat(in)
  m = length(in);
  out = zeros(m,1);
  for i = 1:m
    out(i) =  hermitepoly(in(i));
  end
end

#sigma1_pdf = (0.5*(2*pi)^.5).*exp((sigmas(1,1,:).^4)/16).*(ones(size(sigmas(1,1,:),1))+2.*(sigmas(1,1,:)/2)).^2;
#out	= zeros(m,1);
#sigma2_pdf = (0.5*(2*pi)^.5).*exp((sigmas(2,1,:).^4)/16).*(get_hermite_mat(sigmas(2,1,:))+get_hermite_mat(sigmas(2,1,:))/2).^2;
sigma_intervals = cell(m,max_bits);
sigma_codes = cell(m,max_bits);
for ii = 1:m
  for j = 1:max_bits
    [sigma_intervals(ii,j), sigma_codes(ii,j)] = lloyds(sigmas(ii,:),2^j);
  end
end
fname = ["sigma_code2.mat"];
save (fname, 'sigma_intervals', 'sigma_codes')

