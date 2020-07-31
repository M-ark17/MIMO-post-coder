pkg load communications;
function generate_code(m,n)
  for b = 2:m
    [k,l] = find(tril(magic(b),-1)!=0);
    y = rand(100000,1);
    theta_intervals = cell(k,l,n);
    theta_codes = cell(k,l,n);
    for a = 1:length(k)
      for o = 1:length(l)
	theta = asind((1-y).^(1/(2*l(o))));
	for i = 1:n
  	  [theta_intervals(k(a),l(o),i),theta_codes(k(a),l(o),i)] = lloyds(theta,2^i);
	end
      end
    end
    fname =  ["code_book" num2str(b) ".mat"];
    save (fname, 'theta_intervals', 'theta_codes')
  end
end
