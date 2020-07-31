% ## Copyright (C) 2019 Irina
% ## Author: Irina <Irina@ACER>
% ## Created: 2019-03-27
% IT++ function matched 
% alpha - 1xn vector
% Pt - Total power constraint (not in dB)
% g - 1xn vector, power allocation

function [g] = waterfill(alpha,Pt)
  %Waterfilling 
  n=length(alpha); 
  [a,ind]= sort(alpha); %sorting increasing order

  %find lambda
  for m=1:n
    t=0;
    for j=m:n
      t=t+1/alpha(ind(j));
    end
    t=(t+Pt)/(n-m+1);
    lambda=1/t;
    if (lambda < alpha(ind(m)))       
      break
    end
  end
  
  g=zeros(1,n);
  for j=1:n
    if lambda<alpha(j)
      g(j)= (1/lambda)-(1/alpha(j));
    else
      g(j)=0;
    end
  end
  
end

