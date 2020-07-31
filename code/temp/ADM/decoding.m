#decoding
function [ decoded_output ] = decoding(encoded_input, M1, initial_stp_sz, initial_value)
    decoded_output(1) = 0;
    step_size(1) = initial_stp_sz;

    for i = 2:length(encoded_input)
        if (encoded_input(i) == encoded_input(i-1))
            step_size(i) = M1 * step_size(i-1);
        else
            step_size(i) = (1/M1) * step_size(i-1);
        end
#        if (abs(step_size(i)) >= abs(initial_stp_sz) && (step_size(i) != 0))
#            step_size(i) = step_size(1)/2;
#        end
        decoded_output(i) = decoded_output(i-1) + encoded_input(i)*step_size(i);
    end
end
