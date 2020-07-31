func_file_multi;
iter = 1;
avg = 1;
avg_err = zeros(iter,avg);
mat_sz = 2; 
[~,~,v] = svd(randn(mat_sz)+j*randn(mat_sz));
out = param(v,mat_sz)
size(out)
%for j = 1:avg
%    [~,~,v] = svd(randn(mat_sz)+j*randn(mat_sz));
%    for i = 1:iter
%        v_til = param(v,2);
%        err(i) = norm(v-v_til);
%        avg_err(i,j) = err(i);
%    end
%end
%aerr = sum(avg_err,2)/avg;
%plot([1:iter],aerr)
%title ("Error Vs bits used for quantisation");
%xlabel ("bits");
%ylabel ("norm ")
