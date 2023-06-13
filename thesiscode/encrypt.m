function [cipher] = encrypt(bin_msg, K1, K2, K3, K4,K5,K6,K7,K8)
    %For Encryption of 64 bit msg
    enc = cell(8, 8);
    % Arranging 64 bit into 16 bit block
    enc{1, 1} = bin_msg(1:16);
    enc{1, 2} = bin_msg(17:32);
    enc{1, 3} = bin_msg(33:48);
    enc{1, 4} = bin_msg(49:64);
    
    % For First round
    %Step no 01
    k11=xor(K1,enc{1,2});
    k22=xor(K3,enc{1,3});
    enc{2, 1} = not(xor(k11, enc{1, 1}));
    
   
    enc{2, 2} = xor(fun(enc{2, 1}), enc{1, 3});
%       enc{2, 2} = xor(f_fun(enc{2, 1}), enc{1, 3});
    
 
    enc{2, 4} = not(xor(k22, enc{1, 4}));
    
    
   enc{2, 3} = xor(fun2(enc{2, 4}), enc{1, 2});
%      enc{2, 3} = xor(f_fun(enc{2, 4}), enc{1, 2});


    %Swaping Blocks
    enc{3, 1} = enc{2, 2};
    enc{3, 2} = enc{2, 1};
    enc{3, 3} = enc{2, 4};
    enc{3, 4} = enc{2, 3};
    
    k33=xor(K2,enc{3,2});
    k44=xor(K4,enc{3,3});
    enc{4, 1} = not(xor(k33, enc{3, 1}));
    
    
  
    enc{4, 2} = xor(fun(enc{4, 1}), enc{3, 3});
%       enc{4, 2} = xor(f_fun(enc{4, 1}), enc{3, 3});
    
      
    enc{4, 4} = not(xor(k44, enc{3, 4}));
   
    
    enc{4, 3} = xor(fun2(enc{4, 4}), enc{3, 2});
%      enc{4, 3} = xor(f_fun(enc{4, 4}), enc{3, 2});
     
   % 3rd round  
 %Swaping Blocks
    enc{5, 1} = enc{4, 2};
    enc{5, 2} = enc{4, 1};
    enc{5, 3} = enc{4, 4};
    enc{5, 4} = enc{4, 3};
    
    k55=xor(K5,enc{5,2});
    k66=xor(K7,enc{5,3});
    enc{6, 1} = not(xor(k55, enc{5, 1}));
    
         enc{6, 2} = xor(fun(enc{6, 1}), enc{5, 3});
%       enc{6, 2} = xor(f_fun(enc{6, 1}), enc{5, 3});
    
      enc{6, 4} = not(xor(k66, enc{5, 4}));
    
    
   enc{6, 3} = xor(fun2(enc{6, 4}), enc{5, 2});
%      enc{6, 3} = xor(f_fun(enc{6, 4}), enc{5, 2});
    
     %4th round
     %Swaping Blocks
    enc{7, 1} = enc{6, 2};
    enc{7, 2} = enc{6, 1};
    enc{7, 3} = enc{6, 4};
    enc{7, 4} = enc{6, 3};
     
    k77=xor(K6,enc{7,2});
    k88=xor(K8,enc{7,3});
    enc{8, 1} = not(xor(k77, enc{7, 1}));
    
     enc{8, 2} = xor(fun(enc{8, 1}), enc{7, 3});
%    enc{8, 2} = xor(f_fun(enc{8, 1}), enc{7, 3});
    
      enc{8, 4} = not(xor(k88, enc{7, 4}));
    
    
   enc{8, 3} = xor(fun2(enc{8, 4}), enc{7, 2});
%      enc{8, 3} = xor(f_fun(enc{8, 4}), enc{7, 2});
    

    cipher = [enc{8, 1}, enc{8, 2}, enc{8, 3}, enc{8, 4}];
   
end
