P = 10 % in dB
bits = [3:18];
disp(["-----------------------------------------------Total Power is " num2str(P) "dB---------------------------------------------------"])
disp(["total_bits  phi_bits  theta_bits  Actual_rate Bound"]);
avg_iter = 600;
for i = 1:length(bits)
  rate_act_avg = 0;
  rate_lb_avg = 0;
  rate_equal_avg = 0;
  for j = 1:avg_iter
    filename = ["avg_rate_files_without_sigma/p" num2str(P) "bits" num2str(bits(i)) "sum" num2str(bits(i)) "iterno" num2str(j) ".mat"];
    if(! exist (filename))
      break;
    end
    load (filename);
    if(find(bitCombs(:,1)==bitCombs(:,2)==1))
      rate_equal_avg += rate_lb(find(bitCombs(:,1)==bitCombs(:,2)==1));
    end
    [~,ind] = min(rate_actu-rate_lb);
    rate_act_avg += rate_actu(ind);
    rate_lb_avg += rate_lb(ind);
  end
  rate_act_avg /= j;
  rate_lb_avg /= j;
  rate_equal_avg /=j;
  %bad idea to use ind from last files maximum rate
  disp([bitCombs(ind,1)+bitCombs(ind,2), bitCombs(ind,1), bitCombs(ind,2), rate_act_avg, rate_lb_avg, rate_equal_avg]);
end

