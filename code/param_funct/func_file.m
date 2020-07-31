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
   levels = -pi:2*pi/(2^bits):pi;
   avg = [0,levels(1:end-1)];
   levels = ((levels+avg)/2)(2:end);
   [rows, cols] = size(in);
   out = zeros([rows, cols]);
   for i = 1:rows
      for j = 1:cols
         if(in(i,j) != 0)
             [b,ind] = min(abs(in(i,j)-levels));
             out(i,j) = levels(ind);
         end
      end
   end
end

#quantize theta parameters                                                                        
function [out] = quant_theta1(in, bits)
   [rows, cols] = size(in);
   name = [pwd "/code_book" num2str(rows) ".mat"];
   load(name);
   out = zeros([rows, cols]);
   for i = 1:rows
      for j = 1:cols
         if(in(i,j) != 0)
             levels = [cell2mat(theta_codes(i,j,bits))];
             [b,ind] = min(abs(in(i,j)-levels));
             out(i,j) = cell2mat(theta_codes(i,j,bits))(ind);
         end
      end
   end
end
# quantize singular values
function [out] = quant_singular(in,bits)
   m = length(in);
   name = [pwd "/sigma_code" num2str(m) ".mat"];
   load(name);
   out = zeros(m,1);
   for i = 1:m
     levels = [cell2mat(sigma_codes(i,bits))];
     [b,ind] = min(abs(in(i)-levels));
     out(i) = levels(ind);
   end
end

# reduce 
function [newu, d] = reduce(u)
   d = diag(exp(j*arg(diag(u))));
   newu = d'*u; # convert imaginary to real
end 


function [v_til, d] = reduced_param(v,bits)
   [v, d] = reduce(v);
   phi = zeros(size(v));
   theta = zeros(size(v));
   [row, col] = size(v);

   for i = 1:row
       [v(i:end,i:end), phases, tta] = parameterisation(v(i:end,i:end));
       phi(i:end,i) = phases;
       theta(i+1:end,i) = tta;
   end

   phi = quantize(phi,bits);
   theta = quant_theta1(theta,bits);
   v_til = eye([row,col]);
   for j = 1:row
       cv = reconstruction(phi(j:end,j),theta(:,j),j);
       v_til *= cv;
   end
   v_til = d*v_til;
end

function [v_til] = param(v,bits)
   phi = zeros(size(v));
   theta = zeros(size(v));
   [row, col] = size(v);

   for i = 1:row
       [v(i:end,i:end), phases, tta] = parameterisation(v(i:end,i:end));
       phi(i:end,i) = phases;
       theta(i+1:end,i) = tta;
   end

   phi = quantize(phi,bits);
   theta = quant_theta1(theta,bits);
   v_til = eye([row,col]);
   for j = 1:row
       cv = reconstruction(phi(j:end,j),theta(:,j),j);
       v_til *= cv;
   end
end
