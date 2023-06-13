clc
clear 
close all
t=cputime;
% profile -memory on
% profile clear

Test=0;  %for right key encryption
% Test = 1; % for key sensitivity test
%image process
[user,sys] = memory;%place in the begging of your program

Data = imread('baboon.jpg');
if (size(Data,3)==3)
    Data=rgb2gray(Data);%rgb to gray
end

%imshow(Data)
IS = 256; % Image size
Data1 = imresize(Data, [IS IS]);
[row, col] = size(Data1);
[sdata,maincount]=fwknuthsuffle(Data1);
% 
% imshow(sdata);
[sData, padding] = scalling(sdata, 8);
Data_binary = convert2bin(sData);
Data_binary2 = convert2bin(sData);
%% key gen
hex_key = 'AAAAAAAAAAAAAAAAAAAAACBAAAAAAAAA';
% test='AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB';
[bin_key] = hexa2bin(hex_key);
[K1, K2, K3, K4,K5,K6,K7,K8] = key_gen2(bin_key);
% [K1, K2, K3, K4] = key_gen(bin_key);

bin_key2=bin_key;
%  bin_key2(122) = ~bin_key2(122);
 bin_key2(1) = 0;
 bin_key2(126:127) = 0;
    [p1, p2, p3, p4,p5,p6,p7,p8] = key_gen2(bin_key2);
%     [p1, p2, p3, p4] = key_gen(bin_key2);
%%
orignal_msg = [];
encrypt_msg = [];
decrypt_msg = [];

%% Encryption Process 1
% for kk=1:2
for i = 1:size(Data_binary, 1)
    orignal = Data_binary(i, :);
    orignal_msg(i, :) = orignal;
    tic
    [cipher] = encrypt(orignal, K1, K2, K3, K4,K5,K6,K7,K8);
%     [cipher] = encrypt1(orignal, K1, K2, K3, K4);
    encryption_time(i) = toc;
    encrypt_msg(:, i) = Binary2Dec(cipher);
    cipher_data(i, :) = (cipher);
%     %   if(kk<2)
%     Data_binary(i, :) = cipher;
%     %  end
% end
end


%% for checking bitwise avalanche effects 
cipher_data_1=Data_binary;

%% Encryption Process 2
% for kk=1:2
for i = 1:size(Data_binary2, 1)
    orignal2 = Data_binary2(i, :);
    orignal_msg2(i, :) = orignal2;
    [cipher2] = encrypt(orignal2, p1, p2, p3, p4,p5,p6,p7,p8);
    encrypt_msg2(:, i) = Binary2Dec(cipher2);
    cipher_data2(i, :) = (cipher2);
%     Data_binary2(i, :) = cipher2;
%     %  end
% end
end

com=sum(xor(cipher_data,cipher_data2));
count = sum(com);
fprintf("average p. of bit change: %f\n\n",count);


for i = 1:size(Data_binary, 1)
    cipher = cipher_data(i, :);
    tic
    [plaintext] = decrypt(cipher,K1, K2, K3, K4,K5,K6,K7,K8);
%      [plaintext] = decrypt(cipher, p1, p2, p3, p4,p5,p6,p7,p8);
    decryption_time(i) = toc;
    decrypt_msg(:, i) = Binary2Dec(plaintext);
    recover_data(i, :) = double(plaintext);
    
% end
end
elapsed_time = cputime - t;
[user2,sys2] = memory;%place in the end of your program
memory_used_in_bytes=user2.MemAvailableAllArrays-user.MemAvailableAllArrays;


% Orignal = uint8(reshape(sData, [row, col]));
Orignal=Data1;
% 6 Encrypted Image
Encrypted = uint8(reshape(encrypt_msg, [row, col]));
%Encrypted=Encrypted';
Dec= uint8(reshape(decrypt_msg, [row, col]));

%reverse knuthshuffling
Decrypted=revknuthshuffling(Dec,maincount);

%%
figure
subplot(1, 3, 1)
imshow(Orignal)
title('Orignal')
subplot(1, 3, 2)
imshow(Encrypted)
title('Encrypted')
subplot(1, 3, 3)
imshow(Decrypted)
title('Decrypted')
%%
%
% Histogram
figure
subplot(2, 1, 1)
imhist(Orignal);
title('Original')
subplot(2, 1, 2)
imhist(Encrypted);
title('Encrypted')

% 14 Image Entropy
Y = (imhist(Encrypted) + 0.00001) / (row * col); %(length(Data)-padding);
Y = -sum(Y .* log2(Y));
X = (imhist(Orignal) + 0.00001) / (row * col); %(length(Data)-padding);
X = -sum(X .* log2(X));
Re = [X Y];
%
% 9 Correlation
figure
subplot(1, 2, 1)
scatter(Orignal(1:end - 1), Orignal(2:end), '.');
axis([0 255 0 255])
title('Diagonal co. coeff of orginal Image');
subplot(1, 2, 2)
scatter(Encrypted(1:end - 1), Encrypted(2:end), '.')
axis([0 255 0 255])
title('Diagonal co. coeff of Encrypted Image');
%
% % 1 NPCR(%)
NPCR = sum(sum(Encrypted ~= Orignal)) / (row * col);
% 2 UACI(%)
UACI = sum(sum(abs(Encrypted - Orignal))) / (row * col * 255);
fprintf("NPCR = %f\n",NPCR);
fprintf("UACI = %d\n",UACI);
disp(NPCR);
disp(UACI);
fprintf('PSNR  value = %f \n\n',psnr(Orignal,Encrypted));
ssimval=ssim(Orignal,Encrypted);
fprintf('SSIM value = %f \n\n',ssimval);
%calculate MSE
fprintf('MSE value = %f \n\n',immse(Orignal,Encrypted));

%calculate bit error (BER)
bino=imbinarize(Orignal);
binene=imbinarize(Encrypted);
[num,ratio]=biterr(bino(:,:,1),binene(:,:,1));
fprintf('Number of bit error = %d \n\n',num);
fprintf('Ratio of bit error = %d \n\n',ratio);
fprintf('Entropy of image  = %d \n\n',Re);

%display(sprintf('Generated 8 keys: %f\n',K1,K2,K3,K4,K5,K6,K7,K8));
fprintf('memory_used_in_bytes: %f\n\n',memory_used_in_bytes);
fprintf('Total encryption time: %f\n\n', sum(encryption_time));
fprintf('Total decryption time: %f\n\n', sum(decryption_time));
fprintf('Total clock cycle: %f\n\n',elapsed_time);

disp('Diagonal correlation coefficient of original image');
corrcoef(double(Orignal(1:end - 1)), double(Orignal(2:end)))
disp('Diagonal correlation coefficient of encrypted image');
corrcoef(double(Encrypted(1:end - 1)), double(Encrypted(2:end)))
%profile report
save('result.mat');
%%
