function [plain_text]=decrypt1(binary_cipher,K1,K2,K3,K4)

%Decryption
dec=cell(8,8);
% Arranging 64 bit into 32 bit block
dec{1,1}=binary_cipher(1:32);
dec{1,2}=binary_cipher(33:64);
dec{1,1}=shuffle(dec{1,1});
dec{1,2}=shuffle(dec{1,2});
k3=[K1,K3];
k33=not(xor(k3,dec{1,1}));
k4=[K2,K4];
k44=not(xor(k4,dec{1,2}));
% for first round
%performing Xnor operation with K4
% dec{2,1}=xor(k33,dec{1,1});
dec{2,1}=k33;
%Using f f_function and Xor operation obtain second 16 bit block
% dec{2,2}=xor(k44,dec{1,2});
dec{2,2}=k44;
%step2 swapping blocks
 dec{3,1}=dec{2,2};
 dec{3,2}=dec{2,1};
 
dec{3,1}=shuffle(dec{3,1});
dec{3,2}=shuffle(dec{3,2});
%second round
k1=[K1,K3];
k11=not(xor(k1,dec{3,1}));
k2=[K2,K4];
k22=not(xor(k2,dec{3,2}));

% dec{4,1}=xor(k11,dec{3,1});
% dec{4,2}=xor(k22,dec{3,2});
dec{4,1}=k11;
dec{4,2}=k22;

plain_text=[dec{4,1},dec{4,2}];
end