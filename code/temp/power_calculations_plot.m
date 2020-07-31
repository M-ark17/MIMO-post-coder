P = 0:10:11;
psize = length(P);
lambda_values = zeros(1,psize);
for i = 1:psize
  lambda = 1000:1:1100;
		   %  pcal = (exp(-lambda)/lambda)+gammainc(lambda,1);
		   %  disp( pcal(find(pcal == (P(i)/2))));
  pcal = 162*(gammainc(9,lambda,"upper")-lambda.*gammainc(7,lambda,"upper"))+18*(lambda.*gammainc(8,lambda,"upper")-gammainc(10,lambda,"upper"))+gammainc(11,lambda,"upper")-lambda.*gammainc(9,lambda,"upper");
				%  []min(abs(P(i)/2-pcal));
  pcal./(2*factorial(9)*lambda) 
end
%disp([P/2 lambda_values]);

