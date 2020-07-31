bits = [2:20];
disp(["total_bits  phi_bits  theta_bits  Actual_rate Bound"]);
for i = 1:length(bits)
  filename = ["avg_rate_files_without_sigma/bitssum_" num2str(bits(i)) ".mat"];
  if(! exist (filename))
    break;
  end
  load (filename);
  [~,ind] = min(rate_actu-rate_lb);
  disp([bits(i), bitCombs(ind,1), bitCombs(ind,2), rate_actu(ind), rate_lb(ind)]);
end

