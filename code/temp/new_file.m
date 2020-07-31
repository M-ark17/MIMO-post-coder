func_file;
function [v_all, dist] = code_book_u(bits)
    load("code_book2.mat");
    levels = -pi:2*pi/(2^bits):pi;
    avg = [0,levels(1:end-1)];
    levels = ((levels+avg)/2)(2:end);
    phis = permn(levels,3);
    phis = [phis(:,1:2) zeros(size(phis,1),1) phis(:,3)];
    theta = cell2mat(theta_codes(2,1,bits));
    theta2 = [];
    for i = 1:size(theta)(1)
       theta2 = [theta2;[0 theta(i) 0 0 ]];
    end
    dist = zeros(size(theta)(1)*size(phis),1);
    c=1;
    v_all=[];
    for i = 1:size(theta2,1)
      thet = reshape(theta2(i,:), 2,2);		      
       for j = 1:size(phis,1)
         phi = reshape(phis(j,:),[2 2]);
           v_til = eye(2);
           for l = 1:2
               cv = reconstruction(phi(l:end,l),thet(:,l),l);
               v_til *=  cv;
           end
           if(i ==1 && j==1)
               v_ref = v_til;
           else
               dist(c,:) = norm(v_ref-v_til,'fro');
               c += 1;
           end
           v_all = [v_all;v_til];
        end
    end
    dist;
    #plot(1:15,dist,'-x');
end
