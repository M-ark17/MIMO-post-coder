close all;
clear all;
addpath('~/Documents/Academics/mtp/feedback/code/temp')
nu_func_file;
numerical_Qe_cal;
% pkg load ltfat
#test on randomly generated orthogonal matrices changing with time

alpha = 0.01;
iter = 10;
bits = 5;
tx_ant = 10;
rx_ant = 2;
H = randn(rx_ant,tx_ant)+j*randn(rx_ant,tx_ant);
[ov,~,~] = svd(H,'econ');
v = ov;
Phi = [];
Theta = [];
all_v = [];
for l = 1:iter
    ov = v;
    H = (1-alpha)*H +alpha*(randn(rx_ant,tx_ant)+j*randn(rx_ant,tx_ant));
    [v,~,~] = svd(H,'econ');
    d = diag(diag(ov'*v) ./ abs(diag(ov'*v)))';
    v = v*d;
   # v = generateU(rx_ant);
    all_v = [all_v,v];
    phi = zeros(size(v));
    theta = zeros(size(v));
    p = [];
    t = [];
    for i = 1:min(size(v))
        [v(i:end,i:end), phases, tta] = parameterisation(v(i:end,i:end));
        phi(i:end,i) = phases;
        theta(i+1:end,i) = tta;
        p = [p;phases];
        t = [t;tta];
    end
    Phi = [Phi,p];
    Theta = [Theta,t];
end
all_v = all_v(:,1:iter-2);
# plot Variation of phi and theta for better visualisation
FigH = figure('Position', get(0, 'Screensize'));
r = size(Phi);
[rows, cols] = size(v);
decoded_phi = [];
linestyle = ['+','o','*','x','s','d'];
color = ['r','g','b','m','k','y','c'];
set(gca,'FontSize',25);
for o = 1:r(1)
    p = Phi(o,:);
    quant_p = quantize(p,bits);
    [encoded_p, M1, initial_stp_sz, initial_value] = encoding(quant_p)
    [decoded_p] = decoding(encoded_p, M1, initial_stp_sz, initial_value);
    decoded_phi = [decoded_phi;decoded_p];

    subplot(3,2,1);
    plot(1:r(2),p,LineStyle=[color(o),'-',linestyle(o)],'Linewidth',2,'MarkerSize',10);
set(gca,'FontSize',25);
    title ("Variation of Phi across the channel",'FontSize',20);
    xlabel("time",'FontSize',20);
    ylabel("amplitude",'FontSize',20);
    axis tight;
    hold on

    subplot(3,2,2);
    plot(1:r(2),decoded_p,Linestyle=[color(o),'-',linestyle(o)],'Linewidth',2,'MarkerSize',10);
set(gca,'FontSize',25);
    title ("Variation of ADM decoded Phi across the channel",'FontSize',20);
    xlabel("time",'FontSize',20);
    ylabel("amplitude",'FontSize',20);
    axis tight;
    hold on
end
hold off;
linestyle = ['x','s','d','+','o','*',];
color = ['m','k','c','r','g','b','y'];
 
r = size(Theta);
decoded_theta = [];
for o = 1:r(1)
    t = Theta(o,:);
    recon_v = eye(rows);
    quant_t = quant_theta1_ADM(t,bits);
    [encoded_t, M1, initial_stp_sz, initial_value] = encoding(quant_t);
    [decoded_t] = decoding(encoded_t, M1, initial_stp_sz, initial_value);
    decoded_theta = [decoded_theta;decoded_t];

    subplot(3,2,3);
    plot(1:r(2),Theta(o,:),LineStyle=[color(o),'-',linestyle(o)],'Linewidth',2,'MarkerSize',10);
set(gca,'FontSize',25);
    title ("Variation of Theta across the channel",'FontSize',20);
    xlabel("time",'FontSize',20);
    ylabel("amplitude",'FontSize',20);
    axis tight;
    hold on ;

    subplot(3,2,4);
    plot(1:r(2),decoded_t,LineStyle=[color(o),'-',linestyle(o)],'Linewidth',2,'MarkerSize',10);
set(gca,'FontSize',25);
    title ("Variation of ADM decoded Theta across the channel",'FontSize',20);
    xlabel("time",'FontSize',20);
    ylabel("amplitude",'FontSize',20);
    axis tight;
    hold on

end
hold off;
%Phi
%decoded_phi
% Theta
% decoded_theta
all_rec_v = [];
err = [];
for o = 1:iter
    recon_v = eye(rows);
    % ph = Phi(:,o);
    ph = decoded_phi(:,o);
    phi = zeros(rows);
    l = 1;
    for j = 1:rows
      phi(:,j) = [zeros(j-1,1);ph(l:l+rows-j)];
      l += rows-j+1;
    end
    % tta = Theta(:,o);
    tta = decoded_theta(:,o);
    theta = zeros(rows);
    l = 1;
    for j = 1:rows
      theta(:,j) = [zeros(j,1);tta(l:l+rows-j-1)];
      l += rows-j;
    end
    for j = 1:min(size(v))
        cv = reconstruction(phi(j:end,j),theta(:,j),j);
        recon_v *= cv;
    end
    l = 1;
    all_rec_v = [all_rec_v,recon_v];
    act_v = all_v(:,l:l+rx_ant-1);
    l += iter;
    err = [err;norm(recon_v-act_v,'fro')];
end
subplot(3,2,[5,6]);
plot(1:iter,err,'-*','Linewidth',2,'MarkerSize',10);
set(gca,'FontSize',25);
title ("Norm of difference between actual and reconstructed V matrix",'FontSize',20);
xlabel("time",'FontSize',20);
ylabel ("Frobenious Norm",'FontSize',20);
axis tight;
#set(gcf, 'PaperUnits', 'centimeters');
#set(gcf, 'PaperPosition', [0 0 10 15]); %x_width=10cm y_width=15cm
orient("portrait")
#print(FigH,'adm','-deps');
saveas(gcf, 'adm.pdf','pdf');
