P = 10 % in dB
bits = [3:4];
disp(["-----------------------------------------------Total Power is " num2str(P) "dB---------------------------------------------------"])
disp(["total_bits  phi_bits  theta_bits  Actual_rate Bound"]);
avg_iter = 600;
for i = 1:length(bits)
  rate_act_avg = 0;
  rate_lb_avg = 0;
  for j = 1:avg_iter
    filename = ["avg_rate_files_without_sigma/" num2str(P) "bits" num2str(bits(i)) "sum" num2str(bits(i)) "iterno" num2str(j) ".mat"];
    if(! exist (filename))
      break;
    end
    load (filename);
    [~,ind] = min(rate_actu-rate_lb);
    rate_act_avg += rate_actu(ind);
    rate_lb_avg += rate_lb(ind);
  end
  rate_act_avg /= j;
  rate_lb_avg /= j;
  %bad idea to use ind from last files maximum rate
  disp([bits(i)+bitCombs(ind,1), bitCombs(ind,1), bitCombs(ind,2), rate_act_avg, rate_lb_avg]);
end

bits = [4:18];
disp(["-----------------------------------------------Total Power is " num2str(P) "dB---------------------------------------------------"])
disp(["total_bts   sigma1_bits phi_bits theta_bits Act_rate  Bound"]);
for i = 1:length(bits)
  rate_act_avg = 0;
  rate_lb_avg = 0;
  for j = 1:avg_iter
    filename = ["avg_rate_files/" num2str(P) "bits" num2str(bits(i)) "sumsigma1_" num2str(bits(i)) "iterno" num2str(i) ".mat"];
    if(! exist (filename))
      break;
    end
    load (filename);
    [~,ind] = min(rate_actu-rate_lb);
    rate_act_avg += rate_actu(ind);
    rate_lb_avg += rate_lb(ind);
  end
  rate_act_avg /= j;
  rate_lb_avg /= j;
  disp([bits(i)+ bitCombs(ind,2), bitCombs(ind,1), bitCombs(ind,2), bitCombs(ind,3), rate_act_avg, rate_lb_avg]);
end

bits = [4:18];
disp(["-----------------------------------------------Total Power is " num2str(P) "dB---------------------------------------------------"])
disp(["total_bts sigma1_bits sigma2_bits phi_bits theta_bits Act_rate Bound"]);
for i = 1:length(bits)
  rate_act_avg = 0;
  rate_lb_avg = 0;
  for j = 1:avg_iter
    filename = ["avg_rate_files/" num2str(P) "bits" num2str(bits(i)) "sumsigma" num2str(bits(i)) "iterno" num2str(i) ".mat"];
    if(! exist (filename))
      break;
    end
    load (filename);
    [~,ind] = min(rate_actu-rate_lb);
    rate_act_avg += rate_actu(ind);
    rate_lb_avg += rate_lb(ind);
  end
  rate_act_avg /= j;
  rate_lb_avg /= j;
  disp([bits(i)+bitCombs(ind,3), bitCombs(ind,1), bitCombs(ind,2), bitCombs(ind,3), bitCombs(ind,4), rate_act_avg, rate_lb_avg]);
end

bits = [4:18];
disp(["-----------------------------------------------Total Power is " num2str(P) "dB---------------------------------------------------"])
disp("Acheivable Rate and Bound comparison with all sigmas equal vs only dominant sigma");
disp(["total_bts sigma1_bits sigma2_bits phi_bits theta_bits Act_rate   \
 Bound|  sigma1_bits phi_bits theta_bits Act_rate Bound"]);
for i = 1:length(bits)
  rate_act_avg = 0;
  rate_lb_with_all_sigma_avg = 0;
  rate_lb_with_sigma1_avg = 0;
  for j =1:avg_iter
    filename = ["avg_rate_files_sigma1vssigma2/p" num2str(P) "bits"  num2str(bits(i)) "sumigma1vssigma2_" num2str(bits(i)) "iterno_" num2str(j) ".mat"];
    if(! exist (filename))
      break;
    end
    load (filename);
    [~,ind] = min(rate_actu(1)-rate_lb_with_all_sigma);
    [~,ind1] = min(rate_actu(1)-rate_lb_with_sigma1);
    rate_lb_with_all_sigma_avg += rate_lb_with_all_sigma(ind);
    rate_lb_with_sigma1_avg += rate_lb_with_sigma1(ind1);
    rate_act_avg += rate_actu;
%    disp(["all sigma index " num2str(ind) " only sigma1 index" num2str(ind1)]);
  end
  rate_lb_with_all_sigma_avg /= j;
  rate_lb_with_sigma1_avg /= j;
  rate_act_avg /= j;
  disp([bits(i) bitCombs_all(ind,3), bitCombs_all(ind,1), bitCombs_all(ind,2), bitCombs_all(ind,3), bitCombs_all(ind,4), rate_act_avg(1), rate_lb_with_all_sigma_avg, bitCombs_sigma1(ind1,1), bitCombs_sigma1(ind1,2), bitCombs_sigma1(ind1,3), rate_act_avg(1), rate_lb_with_sigma1_avg]);
end
