function [cipher] = encrypt1(bin_msg, K1, K2, K3, K4)
    %For Encryption of 64 bit msg
    enc = cell(8, 8);
    % Arranging 64 bit into 16 bit block
    enc{1, 1} = bin_msg(1:32);
    enc{1, 2} = bin_msg(33:64);
   
    % For First round
    %Step no 01
    k11=[K1 K3];
    k11=not(xor(k11,enc{1,1}));
    k22=[K2 K4];
    k22=not(xor(k22,enc{1,2}));
    
    %performing xnor operation in first 32 bits with K1
    enc{2, 1} = xor(k11, enc{1, 1});
    % Using f f_function and swaping tecniques on 16 bit
    enc{2, 2} = xor(k22, enc{1, 2});
    %Step no 02
    %shuffle
    enc{2,1}=shuffle(enc{2,1});
    enc{2,2}=shuffle(enc{2,2});
    %Swaping Blocks
    enc{3, 1} = enc{2, 2};
    enc{3, 2} = enc{2, 1};
    k3=[K1 K2];
    k33=not(xor(k3,enc{3,1}));
    k4=[K2 K4];
    k44=not(xor(k4,enc{3,2}));
    % For Second Round
    %performing Xnor operation with K2
    enc{4, 1} = xor(k33, enc{3, 1});
    %Using f f_function and Xor operation obtain second 16 bit block
    enc{4, 2} = xor(k44, enc{3, 2});
    %shuffle
    enc{4,1}=shuffle(enc{4,1});
    enc{4,2}=shuffle(enc{4,2});
 
    cipher = [enc{4, 1}, enc{4, 2}];
    
end
