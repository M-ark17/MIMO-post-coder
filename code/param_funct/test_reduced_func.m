func_file;
iter = 15;
avg = 1000;
avg_err = zeros(iter,avg);
red_avg_err = zeros(iter,avg);
for j = 1:avg
    [~,~,v] = svd(randn(4)+j*randn(4));
    for i = 1:iter
	[red_v_til, d] = reduced_param(v,i);
       # v_til = d*v_til;
	[v_til] = param(v,i);
	red_err(i) = norm(v-red_v_til);
        err(i) = norm(v-v_til);
        avg_err(i,j) = err(i);
	red_avg_err(i,j) = red_err(i);
    end
end
raerr = sum(red_avg_err,2)/avg;
aerr = sum(avg_err,2)/avg;
plot([1:iter],aerr);
legend("error with out reducing parameters");
hold;
plot([1:iter],raerr);
legend("error with out reducing parameters", " error after reducing parameters");
title ("Error Vs bits used for quantisation");
xlabel ("bits");
ylabel ("norm ")

