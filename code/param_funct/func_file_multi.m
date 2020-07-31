1;
global theta_intervals;
global theta_codes;
fname = "code_book2.mat";
load(fname)
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
      for j = 1:cols;
         [b,ind] = min(abs(in(i,j)-levels));
         out(i,j) = levels(ind);
      end
   end
end

#quantize theta parameters                                                                                                                                                  
function [max_bound, min_bound, out] = quant_theta(in, bits)
   global theta_intervals;
   global theta_codes;
   [rows, cols] = size(in);
   out = zeros([rows, cols]);
   max_bound = zeros([rows, cols]);
   min_bound = zeros([rows, cols]);
   for i = 1:rows
      for j = 1:cols
         if(in(i,j) != 0)
             levels = [0;cell2mat(theta_intervals(i,j,bits))];
             codes = [cell2mat(theta_codes(i,j,bits))];
             [b,ind] = min(abs(in(i,j)-codes));
             out(i,j) = cell2mat(theta_codes(i,j,bits))(ind);
	     levels = [levels;90];
	     max_bound(i,j) = levels(ind);
	     min_bound(i,j) = levels(ind-1);
         end
      end
   end
end

#get all the combinations for theta parameter
function [combs] = wphi_combs(phi,bits)
    [row, cols] = size(phi);
    zr_elmnt_phi = find(tril(rand([row,row])) == 0)';
    num_elmnts = row*row;
    combs = [dec2bin(1:2^num_elmnts-1)]+1; # get all possible combinations of the vector
    combs =  (combs - max(combs)(1) + 1); #make it a matrix of required size
    stp_sz = ((2*pi)/2^(bits+1));
    combs(combs == 0) = stp_sz;
    combs(combs == 1) = -stp_sz;
    combs(:,zr_elmnt_phi) = 0;
    combs = unique(combs,'rows');
end

#get all the combinations for theta 
function[combs] = wtheta_combs(ubound, lbound, bits)
    global theta_intervals;
    global theta_codes;
    [row, cols] = size(ubound);
    zr_elmnt_theta = find(tril(rand([row,row],-1)) == 0)';
    num_elmnts = row*row;
    combs = [dec2bin(1:2^num_elmnts-1)]+1; # get all possible combinations of the vector
    combs =  (combs - max(combs)(1) + 1); #make it a matrix of required size
    lbound = reshape(lbound,[1,row*row]);
    ubound = reshape(ubound,[1,row*row]);
    lbound = repmat(lbound,size(combs)(1));
    ubound = repmat(ubound,size(combs)(1));
    combs(combs == 0) = lbound(combs == 0);
    combs(combs == 1) = ubound(combs == 1);
    combs(:,zr_elmnt_theta) = 0;
    combs = unique(combs,'rows');
end

function [v_til_all] = param_multi(v,bits)
    v_til_all = [];
    phi = zeros(size(v));
    theta = zeros(size(v));
    [row, col] = size(v);
    for i = 1:row
        [v(i:end,i:end), phases, tta] = parameterisation(v(i:end,i:end));
        phi(i:end,i) = phases;
        theta(i+1:end,i) = tta;
    end
    phi = quantize(phi,bits);
    [ubound, lbound, theta] = quant_theta(theta,bits);
    phi_combs = wphi_combs(phi,bits);
    theta_combs = wtheta_combs(ubound, lbound, bits);
    for j = 1:size(theta_combs)(1)
        theta1 = reshape(theta_combs(j,:),[row, col]);
        for i = 1:size(phi_combs)(1)
            phi1 = phi;
            tmp = reshape(phi_combs(i,[1:row*col]),[row, col]);
            phi1 = phi1 + tmp;
            v_til = eye([row,col]);
            for j = 1:row
                cv = reconstruction(phi1(j:end,j),theta1(:,j),j);
                v_til *= cv;
            end
            v_til_all = [v_til_all;v_til];
        end
    end
    
%    for j = 1:row
%        cv = reconstruction(phi(j:end,j),theta(:,j),j);
%        v_til *= cv;
%    end
end
