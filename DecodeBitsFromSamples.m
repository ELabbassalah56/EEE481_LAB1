function rec_bit_seq = DecodeBitsFromSamples(rec_sample_seq,case_type,fs)
%
% Inputs:
%   rec_sample_seq: The input sample sequence to the channel
%   case_type:      The sampling frequency used to generate the sample sequence
%   fs:             The bit flipping probability
% Outputs:
%   rec_sample_seq: The sequence of sample sequence after passing through the channel
%
% This function takes the sample sequence after passing through the
% channel, and decodes from it the sequence of bits based on the considered
% case and the sampling frequence

if (nargin <= 2)
    fs = 1;
end

switch case_type
    
    case 'part_1'
        %%% WRITE YOUR CODE FOR PART 1 HERE
        rec_bit_seq  = bitxor(rec_sample_seq,zeros(1,length(rec_sample_seq)/fs));
       
        %%%
    case 'part_2'
        %%% WRITE YOUR CODE FOR PART 2 HERE     
        i_count = 1;
        flag = 0;
        while(i_count <= length(rec_sample_seq))
           i_count = i_count+1;  
           if (rec_sample_seq(i_count-1) == 0)
            flag=flag+1;
           end
           if(mod(i_count,fs) == 0)
            if (flag >= fs / 2)
                rec_bit_seq(i_count / fs) = 0;
            else
                rec_bit_seq(i_count / fs) = 1;
            end
            flag =0;
           end
          
        end
        %%%
    case 'part_3'
        %%% WRITE YOUR CODE FOR PART 3 HERE
        for i_count = fs :fs :length(rec_sample_seq)
            rec_bit_seq(i_count/fs) = bitxor(rec_sample_seq(i_count),zeros(1,length(rec_sample_seq(i_count)/fs)));
        end
            
        %%%
end
end