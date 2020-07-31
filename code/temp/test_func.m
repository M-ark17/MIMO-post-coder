nu_func_file
numerical_Qe_cal
r = 3;
filename = ["best_bit_comb_" num2str(r) ".mat"]
load(filename)
iter = 19;
avg = 20;
avg_err = zeros(iter+1-r,avg);
variable = 1;
for j = 1:avg
#    [~,~,v] = svd(randn(2)+j*randn(2));
  v = generateU(r);
  for i = r:iter
    ii = i-r+1;
    bitCombs = a(ii,:);
    v_til = param(v,bitCombs(1),bitCombs(2:end),variable);
    avg_err(ii,j) = norm(v-v_til,'fro');
  end
  disp(["finished calculating error for iteration ",num2str(j)]);
  fflush(stdout);
end
if (r == 2)
  bits = sum(a,2);
else
  a(:,1) = 3*a(:,1);
  bits = sum(a,2);
end
aerr = sum(avg_err,2)/avg;

disp(["numerical error expectation of u-uhat"]);
disp([bits,aerr]);
fflush(stdout);

%plot([1:iter],aerr);
%title ("Error Vs bits used for quantisation");
%xlabel ("bits");
%ylabel ("norm ")
%disp(["epsilon error calculation"]);
%for i = 3:iter
%  bitCombs = generatecombs(r,i);
%  min_epsiError = epsillon_lloyd_error(r,bitCombs(1,1),bitCombs(1,2:end));
%  for j = 2:length(bitCombs)
%    epsiError = epsillon_lloyd_error(r,bitCombs(j,1),bitCombs(j,2:end));
%    if(epsiError < min_epsiError)
%      min_epsiError = epsiError;
%    end
%  end
%  disp([i,min_epsiError]);
%end
%
%disp(["sigma error calculation"]);
%fflush(stdout);
%for i = 3:iter
%  bitCombs = generatecombs(r,i);
%  min_sigmaError = sigma_lloyd_bound(r,bitCombs(1,1),bitCombs(1,2:end));
%  for j = 2:length(bitCombs)
%    sigmaError = sigma_lloyd_bound(r,bitCombs(j,1),bitCombs(j,2:end));
%    if(sigmaError < min_sigmaError)
%      min_sigmaError = sigmaError;
%    end
%  end
%  disp([i,min_sigmaError]);
%end
