
bits = [3:20];
disp(["total_bits  phi_bits  theta_bits Actual_rate Bound(2) Actual_rate Bound(3)"]);
for i = 1:length(bits)
  rate_disp = [];
  for j = 2:3
    filename = ["bkp_avg_rate_files_with_fixed_sigma_bits/p10bits" num2str(bits(i)) "sum" num2str(bits(i)) "sigma_bits" num2str(j) ".mat"];
    if(! exist (filename))
      break;
    end
    load (filename);
    rate_disp = [rate_disp,rate_ac,rate_l];
  end
  #disp([ bitCombs(ind,1)+bitCombs(ind,2), bitCombs(ind,1), bitCombs(ind,2), rate_disp]);
  disp(bitCombs(ind,1)+bitCombs(ind,2))
end

