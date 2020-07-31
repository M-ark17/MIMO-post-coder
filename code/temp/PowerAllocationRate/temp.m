generateBitcombs;
addpath('../');
for i = 3:15;
  ll = generatecombs(2,i);
  disp([ " bits " num2str(i)]);
  temp = zeros([1,length(ll)]);
  for ii = 1:length(ll);
    temp(ii) = sigma_lloyd_bound(2,ll(ii,1),ll(ii,2));
  end;
  [m,ind] = min(temp);
  disp([num2str( m) " combination " num2str(ll(ind,:))]); 
						      
end;
