func_file;
levels = [pi/2 -pi/2];
phis = permn(levels,3);
phis = [phis(:,1:2) zeros(8,1) phis(:,3)];
theta1 = [0 28.617 0 0];
theta2 = [0 61.237 0 0];
dist = zeros(15,1);
c=1;
for i = 1:2
   for j = 1:8
       phi = reshape(phis(j,:),[2 2]);
       if (i ==1)
           theta = theta1;
       else
           theta = theta2;
       end
       theta = reshape(theta,[2 2]);
       v_til = eye(2);
       for l = 1:2
           cv = reconstruction(phi(l:end,l),theta(:,l),l);
           v_til *=  cv;
       end
       ph = [];
       th = [];
       if(i ==1 && j==1)
           v_ref = v_til;
       else
           dist(c,:) = norm(v_ref-v_til,'fro');
           c += 1;
       end
    end
end
dist
plot(1:15,dist,'-x');
