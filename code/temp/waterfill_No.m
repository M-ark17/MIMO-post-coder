% ## Copyright (C) 2019 Irina
% ## Author: Irina <Irina@ACER>
% ## Created: 2019-03-27
% IT++ function matched 
% alpha - 1xn vector corresponding to the singular values
% Pt - Total power constraint (not in dB)
% No - Noise power (not in dB)
% g - 1xn vector, power allocation- svd values
% Assumes noise power is 1

%function [g] = waterfill(alpha,Pt,No)
%  %Waterfilling 
%  n=length(alpha); 
%  alpha = alpha.^2;
%  [a,ind]= sort(alpha,'descend'); %sorting increasing order
%
%  %find lambda
%  for m=1:n
%    t=0;
%    for j=1:m
%      t=t+No/alpha(ind(j));
%    end
%    t=(t+Pt)/m;
%    lambda=1/t;
%    if (1/lambda < No/alpha(ind(m)))       
%      break
%    end
%  end
%  
%  g=zeros(1,n);
%  for j=1:n
%    if (1/lambda)>(No/alpha(j))
%      g(j)= (1/lambda)-(No/alpha(j));
%    else
%      g(j)=0;
%    end
%  end
%  
%end

function [g] = waterfill_No(alpha,Pt,No)
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
  
  g=zeros(1,n);
  for j=1:n
    if lambda<(alpha(j)/No)
      g(j)= (1/lambda)-(No/alpha(j));
    else
      g(j)=0;
    end
  end
  
end

