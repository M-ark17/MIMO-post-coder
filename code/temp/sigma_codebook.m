pkg load communications;
pkg load miscellaneous;
iterations = 10000;
n = 10;
m = 2;
max_bits = 15;
sigmas = zeros(m,1,iterations);
for i =1:iterations
  h = (1/(2^0.5))*(randn(m,n)+1j*randn(m,n));
  [u,s,v] = svd(h);
  sigmas(:,:,i) = diag(s);
end

#bins = 20;
#[NN,x] = hist(sigmas(1,:),bins,1);
#Fsig1 = exp(-(x.^4)/16)/(2*sqrt(2*pi));
#plot(x, NN * (1 / (x(2) - x(1))));hold on;plot(x, Fsig1, 'r-'); hold off;legend("values from svd ","values from pdf");
#
#figure();
#[NN,x] = hist(sigmas(2,:),bins,1);
#Fsig2 = exp(-x.^4/16)/(2*sqrt(2*pi))+exp(-(x.^6)/4)/(4*sqrt(2*pi));
#plot(x, NN * (1 / (x(2) - x(1))));hold on;plot(x, Fsig2, 'r-');hold off;legend("values from svd ","values from pdf");
#
#x = 0:0.01:4;
#Fsig1 = exp(-(x.^4)/16)/(2*sqrt(2*pi));
#figure();
#plot(x,Fsig1);hold on;
#Fsig2 = exp(-x.^4/16)/(2*sqrt(2*pi))+exp(-(x.^6)/4)/(4*sqrt(2*pi));
#plot(x,Fsig2);hold off;
#legend("pdf of sigma1","pdf of sigma2");
#title("verdu's pdf of unordered sigmas");
sigma_intervals = cell(m,max_bits);
sigma_codes = cell(m,max_bits);
for ii = 1:m
  for j = 1:max_bits
    [sigma_intervals(ii,j), sigma_codes(ii,j)] = lloyds(sigmas(ii,:),2^j);
  end
end
fname = ["sigma_code102.mat"];
save (fname, 'sigma_intervals', 'sigma_codes')

