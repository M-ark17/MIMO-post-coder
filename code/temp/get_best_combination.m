bits = [2:20];
disp(["total_bits  phi_bits  theta_bits  Actual_rate Bound"]);
for i = 1:length(bits)
  filename = ["rate_files/bitssum_" num2str(bits(i)) ".mat"];
  if(! exist (filename))
    break;
  end
  load (filename);
  [~,ind] = min(rate_actu-rate_lb);
  disp([bits(i), bitCombs(ind,1), bitCombs(ind,2), rate_actu(ind), rate_lb(ind)]);
end

bits = [3:21];
disp(["total_bts   sigma1_bits phi_bits theta_bits Act_rate  Bound"]);
for i = 1:length(bits)
  filename = ["rate_files/bitssumsigma1_" num2str(bits(i)) ".mat"];
  if(! exist (filename))
    break;
  end
  load (filename);
  [~,ind] = min(rate_actu-rate_lb);
  disp([bits(i), bitCombs(ind,1), bitCombs(ind,2), bitCombs(ind,3), rate_actu(ind), rate_lb(ind)]);
end

bits = [4:22];
disp(["total_bts sigma1_bits sigma2_bits phi_bits theta_bits Act_rate Bound"]);
for i = 1:length(bits)
  filename = ["rate_files/bitssumsigma_" num2str(bits(i)) ".mat"];
  if(! exist (filename))
    break;
  end
  load (filename);
  [~,ind] = min(rate_actu-rate_lb);
  disp([bits(i), bitCombs(ind,1), bitCombs(ind,2), bitCombs(ind,3), bitCombs(ind,4), rate_actu(ind), rate_lb(ind)]);
end

bits = [3:22];
disp("--------------------------------------------------Total Power is 0 dB------------------------------------------------")
disp(["total_bts sigma1_bits phi_bits theta_bits Act_rate Bound"]);
for i = 1:length(bits)
  filename = ["rate_files/p0bitssumsigma1_" num2str(bits(i)) ".mat"];
  if(! exist (filename))
    break;
  end
  load (filename);
  [~,ind] = min(rate_actu-rate_lb);
  disp([bits(i), bitCombs(ind,1), bitCombs(ind,2), bitCombs(ind,3), rate_actu(ind), rate_lb(ind)]);
end

bits = [4:15];
disp("-----------------------------------------------Total Power is 0 dB---------------------------------------------------")
disp("Acheivable Rate and Bound comparison with all sigmas vs only dominant sigma");
disp(["total_bts sigma1_bits sigma2_bits phi_bits theta_bits Act_rate \
 Bound|  sigma1_bits phi_bits theta_bits Act_rate Bound"]);
for i = 1:length(bits)
  filename = ["rate_files/p0bitssumsigma1vssigmall_" num2str(bits(i)) ".mat"];
  if(! exist (filename))
    break;
  end
  load (filename);
  [~,ind] = min(rate_actu(1)-rate_lb_with_all_sigma);
  [~,ind1] = min(rate_actu(1)-rate_lb_with_sigma1);
  disp([bits(i), bitCombs_all(ind,1), bitCombs_all(ind,2), bitCombs_all(ind,3), bitCombs_all(ind,4), rate_actu(1), rate_lb_with_all_sigma(ind), bitCombs_sigma1(ind1,1), bitCombs_sigma1(ind1,2), bitCombs_sigma1(ind1,3), rate_actu(1), rate_lb_with_sigma1(ind1)]);
end

bits = [4:15];
disp("-------------------------------------------Total Power is 10 dB-------------------------------------------------------")
disp("Acheivable Rate and Bound comparison with all sigmas vs only dominant sigma");
disp(["total_bts sigma1_bits sigma2_bits phi_bits theta_bits Act_rate  \
 Bound|  sigma1_bits phi_bits theta_bits Act_rate Bound"]);
for i = 1:length(bits)
  filename = ["rate_files/bitssumsigma1vssigmall_" num2str(bits(i)) ".mat"];
  if(! exist (filename))
    break;
  end
  load (filename);
  [~,ind] = min(rate_actu(1)-rate_lb_with_all_sigma);
  [~,ind1] = min(rate_actu(1)-rate_lb_with_sigma1);
  disp([bits(i), bitCombs_all(ind,1), bitCombs_all(ind,2), bitCombs_all(ind,3), bitCombs_all(ind,4), rate_actu(1), rate_lb_with_all_sigma(ind), bitCombs_sigma1(ind1,1), bitCombs_sigma1(ind1,2), bitCombs_sigma1(ind1,3), rate_actu(1), rate_lb_with_sigma1(ind1)]);
end

bits = [4:15];
disp("-----------------------------------------------Total Power is 30 dB---------------------------------------------------")
disp("Acheivable Rate and Bound comparison with all sigmas vs only dominant sigma");
disp(["total_bts sigma1_bits sigma2_bits phi_bits theta_bits Act_rate   \
 Bound|  sigma1_bits phi_bits theta_bits Act_rate Bound"]);
for i = 1:length(bits)
  filename = ["rate_files/p30bitssumsigma1vssigmall_" num2str(bits(i)) ".mat"];
  if(! exist (filename))
    break;
  end
  load (filename);
  [~,ind] = min(rate_actu(1)-rate_lb_with_all_sigma);
  [~,ind1] = min(rate_actu(1)-rate_lb_with_sigma1);
  disp([bits(i), bitCombs_all(ind,1), bitCombs_all(ind,2), bitCombs_all(ind,3), bitCombs_all(ind,4), rate_actu(1), rate_lb_with_all_sigma(ind), bitCombs_sigma1(ind1,1), bitCombs_sigma1(ind1,2), bitCombs_sigma1(ind1,3), rate_actu(1), rate_lb_with_sigma1(ind1)]);
end

bits = [4:15];
disp("-----------------------------------------------Total Power is 20 dB---------------------------------------------------")
disp("Acheivable Rate and Bound comparison with all sigmas vs only dominant sigma");
disp(["total_bts sigma1_bits sigma2_bits phi_bits theta_bits Act_rate   \
 Bound|  sigma1_bits phi_bits theta_bits Act_rate Bound"]);
for i = 1:length(bits)
  filename = ["rate_files/p20bitssumnewsigma1vssigmall_" num2str(bits(i)) ".mat"];
  if(! exist (filename))
    break;
  end
  load (filename);
  [~,ind] = min(rate_actu(1)-rate_lb_with_all_sigma);
  [~,ind1] = min(rate_actu(1)-rate_lb_with_sigma1);
  disp([bits(i), bitCombs_all(ind,1), bitCombs_all(ind,2), bitCombs_all(ind,3), bitCombs_all(ind,4), rate_actu(1), rate_lb_with_all_sigma(ind), bitCombs_sigma1(ind1,1), bitCombs_sigma1(ind1,2), bitCombs_sigma1(ind1,3), rate_actu(1), rate_lb_with_sigma1(ind1)]);
end

bits = [4:15];
disp("-----------------------------------------------Total Power is 10 dB---------------------------------------------------")
disp("Acheivable Rate and Bound comparison with all sigmas equal vs only dominant sigma");
disp(["total_bts sigma1_bits sigma2_bits phi_bits theta_bits Act_rate   \
 Bound|  sigma1_bits phi_bits theta_bits Act_rate Bound"]);
for i = 1:length(bits)
  filename = ["rate_files/p10bitssumigma1eqsigma2_" num2str(bits(i)) ".mat"];
  if(! exist (filename))
    break;
  end
  load (filename);
  [~,ind] = min(rate_actu(1)-rate_lb_with_all_sigma);
  [~,ind1] = min(rate_actu(1)-rate_lb_with_sigma1);
  disp([bits(i), bitCombs_all(ind,1), bitCombs_all(ind,2), bitCombs_all(ind,3), bitCombs_all(ind,4), rate_actu(1), rate_lb_with_all_sigma(ind), bitCombs_sigma1(ind1,1), bitCombs_sigma1(ind1,2), bitCombs_sigma1(ind1,3), rate_actu(1), rate_lb_with_sigma1(ind1)]);
end
