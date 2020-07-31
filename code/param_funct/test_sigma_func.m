func_file
iter = 12;
avg = 10;
avg_err = zeros(avg,iter);
for j = 1:avg
    [~,v,~] = svd(randn(2)+1j*randn(2));
    v = diag(v);
    err = zeros(iter,1);
    disp(v);
    for i = 1:iter
        v_til = quant_singular(v,i);
        #err(i) = norm(v-v_til,'fro').^2;
	err(i) = abs(v(1)-v_til(1));
    end
    avg_err(j,:) = err;
    disp(avg_err(j,:));
    fflush(stdout);
end
aerr = sum(avg_err.^2,1)/avg;
plot([1:iter],aerr);
title ("Error Vs bits used for quantisation");
xlabel ("bits");
ylabel ("norm ");

