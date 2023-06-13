function [plain_text]=decrypt(binary_cipher,K1,K2,K3,K4,K5,K6,K7,K8)

%Decryption
dec=cell(8,8);
% Arranging 64 bit into 16 bit block
dec{1,1}=binary_cipher(1:16);
dec{1,2}=binary_cipher(17:32);
dec{1,3}=binary_cipher(33:48);
dec{1,4}=binary_cipher(49:64);

% for first round
% dec{2,2}=xor(f_fun(dec{1,4}),dec{1,3});
% dec{2,3}=xor(f_fun(dec{1,1}),dec{1,2});
dec{2,2}=xor(fun2(dec{1,4}),dec{1,3});
dec{2,3}=xor(fun(dec{1,1}),dec{1,2});

k77=xor(K6,dec{2,2});
k88=xor(K8,dec{2,3});

dec{2,1}=not(xor(k77,dec{1,1}));
dec{2,4}=not(xor(k88,dec{1,4}));

%step2 swapping blocks
 dec{3,1}=dec{2,2};
 dec{3,2}=dec{2,1};
 dec{3,3}=dec{2,4};
 dec{3,4}=dec{2,3};
 
 %2nd round
% dec{4,2}=xor(f_fun(dec{3,4}),dec{3,3});
% dec{4,3}=xor(f_fun(dec{3,1}),dec{3,2});
 dec{4,2}=xor(fun2(dec{3,4}),dec{3,3});
 dec{4,3}=xor(fun(dec{3,1}),dec{3,2});
 
k55=xor(K5,dec{4,2});
k66=xor(K7,dec{4,3});

dec{4,1}=not(xor(k55,dec{3,1}));
dec{4,4}=not(xor(k66,dec{3,4}));

%step2 swapping blocks
 dec{5,1}=dec{4,2};
 dec{5,2}=dec{4,1};
 dec{5,3}=dec{4,4};
 dec{5,4}=dec{4,3};
 


% for 3rd round
% dec{6,2}=xor(f_fun(dec{5,4}),dec{5,3});
% dec{6,3}=xor(f_fun(dec{5,1}),dec{5,2});
dec{6,2}=xor(fun2(dec{5,4}),dec{5,3});
dec{6,3}=xor(fun(dec{5,1}),dec{5,2});

k33=xor(K2,dec{6,2});
k44=xor(K4,dec{6,3});

dec{6,1}=not(xor(k33,dec{5,1}));
dec{6,4}=not(xor(k44,dec{5,4}));

%step2 swapping blocks
 dec{7,1}=dec{6,2};
 dec{7,2}=dec{6,1};
 dec{7,3}=dec{6,4};
 dec{7,4}=dec{6,3};
 
 %4thhh
 
% dec{8,2}=xor(f_fun(dec{7,4}),dec{7,3});
% dec{8,3}=xor(f_fun(dec{7,1}),dec{7,2});
 dec{8,2}=xor(fun2(dec{7,4}),dec{7,3});
 dec{8,3}=xor(fun(dec{7,1}),dec{7,2});
 
k11=xor(K1,dec{8,2});
k22=xor(K3,dec{8,3});

dec{8,1}=not(xor(k11,dec{7,1}));
dec{8,4}=not(xor(k22,dec{7,4}));

plain_text=[dec{8,1},dec{8,2},dec{8,3},dec{8,4}];
end