function [lambda] = lambdaPower(alpha,Pt,No)
  %Waterfilling 
  n=length(alpha); 
  alpha=alpha.^2;
  [a,ind]= sort(alpha); %sorting increasing order

  %find lambda
  for m=1:n
    t=0;
    for j=m:n
      t=t+No/alpha(ind(j));
    end
    t=(t+Pt)/(n-m+1);
    lambda=1/t;
    if (lambda < alpha(ind(m))/No)       
      break
    end
  end

end

