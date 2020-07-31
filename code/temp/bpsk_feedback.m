# BER for QPSK system using partial CSI
nu_func_file;
transmit_ant = 10;
receive_ant = 2;
number_of_bits = 100;
max_bits_per_param = 10;
SNR = 1:2:20;# in decibels
Noise_power = 1; #in linear scale
snr = 10.^(SNR/10);
signal_power = snr*Noise_power;
iterations = 100
ber_snr = zeros(length(snr),max_bits_per_param);
ber_theory_snr = zeros(length(snr),max_bits_per_param);
# generate channel and data symbols
all_channels =(1/2**0.5)*randn(receive_ant,transmit_ant,iterations)+1j*randn(receive_ant,transmit_ant,iterations);
for j = 1:length(snr)
    ber = zeros(max_bits_per_param,1);
    ber_theory = zeros(max_bits_per_param,1);
    
    for i =1:iterations
        channel =  all_channels(:,:,i);
        ip_bits = randi([0 1],number_of_bits,1);
        bpsk_bits = 2*ip_bits-1;
        [u,s,v] = svd(channel,'econ');
        p_sigma = waterfill_No(diag(s),signal_power(j),Noise_power);

        for j = 1:max_bits_per_param 
            u_till = param(u,j);
            err_count = 0; 
            err_count_theory = 0; 

            for i = 1:number_of_bits
                input_bits = bpsk_bits(i)*ones(receive_ant,1);
                transmitted_data = (u*s*v'*v*(diag(p_sigma.^0.5)*input_bits));
                noise = (Noise_power/(2**.5))*randn(receive_ant,1)+1j*randn(receive_ant,1);
                received_data = u_till'*transmitted_data+u_till'*noise;
                received_data ./=diag(s);
                received_data(real(received_data)>=0) = 1;  
                received_data(real(received_data)<0) = -1;  
                err_count += nnz(input_bits!=received_data);
                received_data_theory = u'*transmitted_data+u'*noise;
                received_data_theory ./=diag(s);
                received_data_theory(real(received_data_theory)>=0) = 1;  
                received_data_theory(real(received_data_theory)<0) = -1;  
                received_data_theory;
                err_count_theory += nnz(input_bits!=received_data_theory);
            end
	    
            ber(j) += err_count/(2*number_of_bits);
            ber_theory(j) += err_count_theory/(2*number_of_bits);
        end

        ber /= iterations;
        ber_theory /= iterations;
    end

    ber_snr(j,:) = ber;
    ber_theory_snr(j,:) = ber_theory;
end
