#encoding
function [encoded_output, M1, initial_stp_sz, initial_value] = encoding(inp)
    a = rand(3);
    % M1 = max(a(find(a>0.5)))*2;
    M1 = 1.7;
    diff = inp(2)-inp(1);
    initial_stp_sz = inp(1);
    if(inp(1) == 0)
      initial_stp_sz = max(inp);
    end
    initial_value = inp(1);
    if(diff > 0)
        encoded_output(1) = 1;
       # if(diff == 0 )
       #     initial_stp_sz = inp(1)/M1;
       # end
    else
        encoded_output(1) = -1;
    end

    for i = 2:length(inp)
        diff = inp(i) - inp(i-1);
        if(diff > 0)
            encoded_output(i) = 1;
        else
            encoded_output(i) = encoded_output(i-1)*-1;
        end
#	if(i >= 3)
#		tmp = inp(i-1)-inp(i-2);
#		if(tmp == 0)
#		    encoded_output(i) = encoded_output(i-1)*-1;
#		end
#	end    
    end
end
