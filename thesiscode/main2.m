clc
clear 
close all

% Define the image encryption system
key = randi([0 1], 1,128);
plaintext = imread('Lena.jpg');
IS = 256; % Image size
plaintext = imresize(plaintext, [IS IS]);
[row, col] = size(plaintext);

% [sdata,maincount]=fwknuthsuffle(plaintext);

[sData, padding] = scalling(plaintext, 8);
Data_binary = convert2bin(sData);
Data_binary2 = convert2bin(sData);

%% key gen
hex_key = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
[bin_key] = hexa2bin(hex_key);

[K1, K2, K3, K4,K5,K6,K7,K8] = key_gen2(bin_key);
orignal_msg = [];
encrypt_msg = [];
decrypt_msg = [];

%% Encryption Process 1
for kk=1:2
for i = 1:size(Data_binary, 1)
    orignal = Data_binary(i, :);
    orignal_msg(i, :) = orignal;
    
    [cipher] = encrypt(orignal, K1, K2, K3, K4,K5,K6,K7,K8);

end
end

% Choose a linear approximation
linear_approximation = @(x) bitxor(bitshift(x, -1), mod(x, 2));

% Generate plaintext-ciphertext image pairs
num_pairs = 16;
pairs = cell(num_pairs, 2);
for i = 1:num_pairs
    pairs{i, 1} = Data_binary;

for i = 1:size(Data_binary, 1)
    orignal11 = Data_binary(i, :);
    orignal_msg11(i, :) = orignal11;
    [cipher1] = encrypt(orignal11, K1, K2, K3, K4,K5,K6,K7,K8);
end
    pairs{i, 2} = cipher;
end

% Calculate correlation coefficients
correlations = zeros(1, 256);
for i = 0:255
    sum = 0;
    for k = 1:num_pairs
        x = bitand(pairs{k, 1}, i);
        y = bitand(pairs{k, 2}, i);
        sum = sum + linear_approximation(bitxor(x, y));
    end
    correlations(i+1) = abs(sum/num_pairs - 0.5);
end

% Find the key with the highest correlation coefficient
[max_corr, index] = max(correlations);
key_guess = dec2bin(index-1, 8)-'0';

% Test the key
[K11, K22, K33, K44,K55,K66,K77,K88] = key_gen2(key_guess);
for i = 1:size(Data_binary, 1)
    cipher11 = cipher(i, :);
    tic
    [plaintext] = decrypt(cipher11,K11, K22, K33, K44,K55,K66,K77,K88);
    decrypt_msg(:, i) = Binary2Dec(plaintext);
    recover_data(i, :) = double(plaintext);
    
end
decrypted=uint8(reshape(decrypt_msg, [256, 256]));

imshowpair(plaintext, decrypted, 'montage');








