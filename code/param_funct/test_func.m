addpath('../temp/');
numerical_Qe_cal
func_file
iter = 19;
avg = 10;
avg_err = zeros(iter,avg);
for j = 1:avg
#    [~,~,v] = svd(randn(2)+j*randn(2));
  v = generateU(2);
    for i = 1:iter
        v_til = param(v,i);
        err(i) = norm(v-v_til,'fro');
        avg_err(i,j) = err(i);
    end
    disp(["currently finding error for " , num2str(j), "..."]);
    fflush(stdout);
end
aerr = sum(avg_err,2)/avg;
plot([1:iter],aerr);
title ("Error Vs bits used for quantisation");
xlabel ("bits");
ylabel ("norm ")

