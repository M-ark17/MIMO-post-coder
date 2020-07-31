bits = [2:20];
iterations = 700;
antennas = [2, 4, 6];
disp(["total_bits  phi_bits  theta_bits  Actual_rate Bound"]);
for ii = 1:length(antennas)
  disp(["number of transmit antennas" num2str(antennas(ii))]);
  for i = 1:length(bits)
    bit = 0;
    rate_act = 0;
    rate_l = 0;
    for iter = 1:700
      filename = ["avg_rate_files_diff_ant/p10ant" num2str(antennas(ii)) "bits" num2str(bits(i))  "sum" num2str(bits(i)) "iterno" num2str(iter) ".mat"];
      if(! exist (filename))
	break;
      end
      load (filename);
      [~,ind] = min(rate_actu-rate_lb);
      rate_act += rate_actu(ind);
      rate_l += rate_lb(ind);
    end
    disp([bits(i)  abs(rate_act)/iter, abs(rate_l)/iter]);
  end
end

