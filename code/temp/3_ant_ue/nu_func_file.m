1;
#parameterisation
function [trans_v, phases, theta] = parameterisation(V)
    trans_v = V;
    [rows,cols] = size(trans_v);
    theta = [];

    # extract phases
    phases = angle(trans_v(:,1));
    D = diag(exp(j*phases));
    trans_v = D'*trans_v; #'make real valued column

    #apply givens rotation
    for j = rows:-1:2
        G_p = eye(rows,cols);
        G = givens(trans_v(j-1,1),trans_v(j,1));
        theta = [atan2d(real(G(1,2)),real(G(1,1)));theta];
        G_p([j-1 j],[j-1,j]) = G;
        trans_v = G_p*trans_v;
        D *= G_p;
    end
end

#reconstruction
function [cv] = reconstruction(phi,theta,l)
   [rows,cols] =  size(phi);
   rows += l-1;

   #generate phases
   D1 = diag([ones(l-1,1);exp(j*phi(:,1))]);

   #revert givens rotation
   for j = rows-1:-1:1
       G_p = eye(rows);
       thta = theta(j+1);
       G = [cosd(thta) -sind(thta);sind(thta) cosd(thta)];
       G_p([j j+1],[j j+1]) = conj(G);
       D1 *= G_p;
   end
   cv = D1;
end

#quantize phi parameters
function [out] = quantize(in, bits)
  fname = ["levels/levels" num2str(2^bits) ".mat"];
  load (fname);
   avg = [0,levels(1:end-1)];
   levels = ((levels+avg)/2)(2:end);
   table = (levels(2:length(levels)) + levels(1:(length(levels)-1))) / 2;
   [rows, cols] = size(in);
   out = zeros([rows, cols]);
   if(!isempty(levels))
     for i = 1:rows
       for j = 1:cols
	 [~,out(i,j)] = quantiz(in(i,j), table, levels);
       end
     end
   end
end

#quantize theta parameters using uniform quantization
function [out] = quantize_theta(in, bits)
   levels = 0:pi/2^bits:pi/2;
   avg = [0,levels(1:end-1)];
   levels = ((levels+avg)/2)(2:end);
   [rows, cols] = size(in);
   out = zeros([rows, cols]);
   for i = 1:rows
      for j = 1:cols
             [b,ind] = min(abs(in(i,j)-levels));
             out(i,j) = levels(ind);
      end
   end
end


#quantize theta parameters                                                                        
function [out] = quant_theta1(in, bits, variable_bit=0)
   [rows, cols] = size(in);
   name = [pwd "/code_book" num2str(rows) ".mat"];
   load(name);
   out = zeros([rows, cols]);
   for i = 1:rows
     for j = 1:cols
       if(variable_bit)
	 bit = bits(i,j);
       else
	 bit = bits;
       end
       if(in(i,j)!=0)
         levels = [cell2mat(theta_codes(i,j,bit))];
         table = [cell2mat(theta_intervals(i,j,bit))];
	 [~,out(i,j)] = quantiz(in(i,j), table, levels);
       end
     end
   end
end

#quantization for ADM
function [out] = quant_theta1_ADM(in, bits)
   [rows, cols] = size(in);
   name = [pwd "/code_book2.mat"];
   load(name);
   out = zeros([rows, cols]);
   if(in!=0)
     levels = [cell2mat(theta_codes(2,1,bits))];
     [b,ind] = min(abs(in-levels));
     out =levels(ind);
   end
end

# quantize singular values
function [out] = quant_singular(in,bits)
   m = length(in);
   name = [pwd "/sigma_code102.mat"];
   load(name);
   out = zeros(m,1);
   for i = 1:m
     if(bits(i) != 0)
       levels = [cell2mat(sigma_codes(i,bits(i)))];
       [b,ind] = min(abs(in(i)-levels));
       out(i) = levels(ind);
     else
       out(i) = 0;
     end
   end
end

# reduce 
function [newu, d] = reduce(u)
   d = diag(exp(j*arg(diag(u))));
   newu = d'*u; # convert imaginary to real
end 

function [v_til, d] = reduced_param(v, bits_phi, bits_theta)
   [v, d] = reduce(v);
   phi = zeros(size(v));
   theta = zeros(size(v));
   [row, col] = size(v);
   for i = 1:row
       [v(i:end,i:end), phases, tta] = parameterisation(v(i:end,i:end));
       phi(i:end,i) = phases;
       theta(i+1:end,i) = tta;
   end
   phi = quantize(phi,bits_phi);
   phi(1,1) = 0;
   theta = quant_theta1(theta,bits_theta);
   v_til = eye([row,col]);
   for j = 1:row
       cv = reconstruction(phi(j:end,j),theta(:,j),j);
       v_til *= cv;
   end
   v_til = d*v_til;
end

function [v_til] = param(v, bits_phi, bits_theta, variable=0)
   phi = zeros(size(v));
   theta = zeros(size(v));
   [row, col] = size(v);
   for i = 1:row
       [v(i:end,i:end), phases, tta] = parameterisation(v(i:end,i:end));
       phi(i:end,i) = phases;
       theta(i+1:end,i) = tta;
   end
   phi = quantize(phi,bits_phi);
   theta = quant_theta1(theta, bits_theta, variable);
   v_til = eye([row,col]);
   for j = 1:row
       cv = reconstruction(phi(j:end,j),theta(:,j),j);
       v_til *= cv;
   end
end

function [phi,theta,alpha,gamma,v_til] =  params(v, bits_phi, bits_theta, variable=0)
   phi = zeros(size(v));
   theta = zeros(size(v));
   [row, col] = size(v);
   for i = 1:row
       [v(i:end,i:end), phases, tta] = parameterisation(v(i:end,i:end));
       phi(i:end,i) = phases;
       theta(i+1:end,i) = tta;
   end
   alpha = quantize(phi,bits_phi);
   gamma = quant_theta1(theta, bits_theta, variable );
   v_til = eye([row,col]);
   for j = 1:row
       cv = reconstruction(alpha(j:end,j),gamma(:,j),j);
       v_til *= cv;
   end
end

function s = sigma_lloyd_bound_r(r, b1, b2)
  s = r * (r - 1) * (1 - sinc(2**(-b1)));
  for l=1:r*(r-1)/2
    s = s + beta(2 / 3, l+1 / 3)**3 * l / 3 / 2**(2 * b2(l)+ 3);
  end;
end;

function s = sigma_lloyd_bound_reduced(r, b1, b2)
  s = (r - 1) * (1 - sinc(2**(-b1)));
  for l=1:(r-1)
    s = s + beta(2 / 3, l+1 / 3)**3 * l / 3 / 2**(2 * b2(l)+ 3);
  end;
end;

pkg load symbolic
function [P] = getPower(r,t,lambda)
  syms k;
  syms y;
  assume y positive;
  syms sig;
  eqn =r*int((1/y - 1/sig)*symsum((factorial(k)/factorial(k+t-r))*laguerreL(k,t-r,sig)^2*sig^(t-r)*exp(-sig),k,0,r-1)/r,sig,[y,inf]);
  P = double(subs(eqn,y,lambda));
end

function [combs] = generatecombs(parts,sum)
  if(parts == 2)
    iter1 = 1;
  else
    iter1 = sum-parts+1;
  end
  combs = [];
  for i = 1:iter1
    for j = 1:sum
      if(parts == 2)
	if(j >=sum)
          break;
	end
	combs = [combs;[j,sum-j]];
      else
	if(i+j >= sum)
	  break;
	end;
	combs = [combs;[i,j,sum-i-j]];
      end
    end
  end
end

function [combs] = generate4combs(sum)
  combs = [];
  for i = 1:sum-3 
    tmp = generatecombs(3,sum-i);
    combs = [combs;[ones(size(tmp,1),1)+i-1 tmp]];
  end
end
