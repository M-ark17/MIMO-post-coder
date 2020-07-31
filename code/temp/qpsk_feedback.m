
clear all; close all; clc;
# BER for QPSK system using partial CSI
nu_func_file;
numerical_Qe_cal;
load("best_bit_comb_2.mat");
transmit_ant = 4;
receive_ant = 2;
number_of_bits = 50000;
max_bits_per_param = 2:2:16;
#max_bits_per_param = [1,3];
SNR = 0:2:20;# in decibels
#SNR = 18;# in decibels
Noise_power = 10; #in linear scale
snr = 10.^(SNR/10);
signal_power = snr*Noise_power;
ber_snr = zeros(length(snr),length(max_bits_per_param));
leg = [];
# generate channel and data symbols
function [out_sym] = qpsk_modulate(in_bits)
    out_sym = in_bits(1)+1j*in_bits(2);
end

function out_bits = qpsk_demodulate(in_sym)
    bit1 = zeros(size(in_sym));
    bit2 = zeros(size(in_sym));
    bit1(real(in_sym)>=0) = 1;
    bit1(real(in_sym)<0) = -1;
    bit2(imag(in_sym)>=0) = 1;
    bit2(imag(in_sym)<0) = -1;
    out_bits = [bit1 bit2];
end

ber_theory = zeros(length(snr),1);
for j = 1:length(snr)
    channel =(1/2**0.5)*(randn(receive_ant,transmit_ant)+1j*randn(receive_ant,transmit_ant));
    ip_bits = randi([0 1],number_of_bits,1);
    qpsk_bits = 2*ip_bits-1;
    [u,s,v] = svd(channel,'econ');
    p_sigma = waterfill_No(diag(s),signal_power(j),Noise_power);
    u = generateU(receive_ant);
    s = zeros(receive_ant);
    s(1) = 1;
    p_sigma(1,1) = signal_power(j); 
    disp(["SNR = ", num2str(SNR(j))]);fflush(stdout);
    for jj = 1:length(max_bits_per_param) 
      bitComb = a(sum(a,2)==max_bits_per_param(jj),:);
      u_till = param(u,bitComb(1),bitComb(2));
      err_count = 0; 
      err_count_theory = 0; 
      
      for ii = 1:2:number_of_bits
        input_bits = [qpsk_bits(ii) qpsk_bits(ii+1)];
        input_sym = qpsk_modulate(input_bits)*ones(receive_ant,1);
        transmitted_data = (u*s*v'*v*(diag(p_sigma.^0.5)*input_sym));
        noise = (Noise_power/(2**.5))*(randn(receive_ant,1)+1j*randn(receive_ant,1));
        received_data = u_till'*transmitted_data+u_till'*noise;
        received_data ./= diag(s);
        received_data = qpsk_demodulate(received_data);
#            disp("output");disp(received_data(1,:));
#	    disp("input");disp(input_bits);
        err_count += nnz(input_bits!=received_data(1,:));
        if(jj ==1)
          received_data_theory = u'*transmitted_data+u'*noise;
          received_data_theory ./= diag(s);
    	  received_data_theory = qpsk_demodulate(received_data_theory);
    	  err_count_theory += nnz(input_bits!=received_data_theory(1,:));
    	end
      end
      ber(jj) = err_count/(2*number_of_bits);
      if(jj == 1)
        ber_theory(j) = err_count_theory/(2*number_of_bits);
      end
    end
    ber_snr(j,:) = ber';
    disp(["Finished ber calculation for SNR " num2str(SNR(j)) " ..."]); fflush(stdout);
end
    #plot(log(ber_snr(:,3:end)),"linewidth", 3);
    #xlabel("SNR (dB)", "fontsize", 20);ylabel("BER", "fontsize", 20);
#title("BER vs SNR for QPSK","fontsize",25);grid on;
#legend(mat2cell(leg, 1));legend("show");set(gca, "linewidth", 1, "fontsize", 21);
