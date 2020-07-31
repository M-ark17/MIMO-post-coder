load "expcostheta1.mat" 
load "expcostheta2.mat"
load "sinc.mat"
for i = 1:14;Qe3(1,1,i)=s(i)+ect2(i);Qe3(2,2,i)=2*s(i)+ect1(i)+ect2(i);Qe3(3,3,i)=3*s(i)+2*ect1(i);end
save "Q.mat" "Qe3"
