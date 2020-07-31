function plainZF(K=3,M=9,Pdb=10,No=1)
  P = 10^(Pdb/10);
  iter = 30000;
  alpha = 0;
  for i = 1:iter
    H = randn(K,M)+1j*randn(K,M);
    [~,s,~] = svd(H);
    alpha += trace(s.^-2); 
  end
  alpha /= iter;
  rate = 0;
  capacity = 0;
  for n = 1:iter
    H = randn(K,M)+1j*randn(K,M);
    s = svd(H,'econ');
    Pwaterfill = waterfill_No(s,P,No);
    channel_capacity = 0;
    for l = 1:K
      channel_capacity += log2(1+Pwaterfill(l)*s(l)^2);
    end
    rate  += log2(det(eye(K)+P*alpha*H*H'/K)); #rate acheived using Zero Forcing precoding
    capacity += channel_capacity;
  end
  disp([rate/iter, capacity/iter]);
end
