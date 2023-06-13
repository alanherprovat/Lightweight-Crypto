function [k111, k222, k333, k444] = key_gen(bin_key)
    %making a cell
    key = cell(5, 8);
    %First for matrix of 16bit each
    key{1, 1} = f_fun(bin_key(1:16)); %bin_key(1:16);
    key{1, 2} = f_fun(bin_key(17:32)); %bin_key(17:32);
    key{1, 3} = f_fun(bin_key(33:48)); %bin_key(33:48);
    key{1, 4} = f_fun(bin_key(49:64)); %bin_key(49:64);
    key{1, 5} = f_fun(bin_key(65:80)); %bin_key(65,80);
    key{1, 6} = f_fun(bin_key(81:96)); %bin_key(81,96);
    key{1, 7} = f_fun(bin_key(97:112)); %bin_key(97,112);
    key{1, 8} = f_fun(bin_key(113:128)); %bin_key(113,124);

    % generating a matrix of each 16bit int 4*4
    key{2, 1}(1, :) = key{1, 1}(1:4);
    key{2, 1}(2, :) = key{1, 1}(5:8);
    key{2, 1}(3, :) = key{1, 1}(9:12);
    key{2, 1}(4, :) = key{1, 1}(13:16);
    
    key{2, 2}(1, :) = key{1, 2}(1:4);
    key{2, 2}(2, :) = key{1, 2}(5:8);
    key{2, 2}(3, :) = key{1, 2}(9:12);
    key{2, 2}(4, :) = key{1, 2}(13:16);
    
    key{2, 3}(1, :) = key{1, 3}(1:4);
    key{2, 3}(2, :) = key{1, 3}(5:8);
    key{2, 3}(3, :) = key{1, 3}(9:12);
    key{2, 3}(4, :) = key{1, 3}(13:16);
    
    key{2, 4}(1, :) = key{1, 4}(1:4);
    key{2, 4}(2, :) = key{1, 4}(5:8);
    key{2, 4}(3, :) = key{1, 4}(9:12);
    key{2, 4}(4, :) = key{1, 4}(13:16);
    
    key{2, 5}(1, :) = key{1, 5}(1:4);
    key{2, 5}(2, :) = key{1, 5}(5:8);
    key{2, 5}(3, :) = key{1, 5}(9:12);
    key{2, 5}(4, :) = key{1, 5}(13:16);
    
    key{2, 6}(1, :) = key{1, 6}(1:4);
    key{2, 6}(2, :) = key{1, 6}(5:8);
    key{2, 6}(3, :) = key{1, 6}(9:12);
    key{2, 6}(4, :) = key{1, 6}(13:16);
    
    key{2, 7}(1, :) = key{1, 7}(1:4);
    key{2, 7}(2, :) = key{1, 7}(5:8);
    key{2, 7}(3, :) = key{1, 7}(9:12);
    key{2, 7}(4, :) = key{1, 7}(13:16);
    
    key{2, 8}(1, :) = key{1, 8}(1:4);
    key{2, 8}(2, :) = key{1, 8}(5:8);
    key{2, 8}(3, :) = key{1, 8}(9:12);
    key{2, 8}(4, :) = key{1, 8}(13:16);
    
%     matrix41=circshift(key{2,1},[1 3]);
    c=1;
    tk1=key{2,1};
for i = 2:size(tk1)      % Knuth shuffle in forward direction:
   
   w    = floor(rand * i)+1;   % 1 <= w <= i
   t    = tk1(w);
   tk1(w) = tk1(i);
   tk1(i) = t;
   c=c+1;
end
%     matrix42=circshift(key{2,2},[2 3]);
 c=1;
    tk2=key{2,2};
for i = 2:size(tk2)      % Knuth shuffle in forward direction:
   
   w    = floor(rand * i)+1;   % 1 <= w <= i
   t    = tk2(w);
   tk2(w) = tk2(i);
   tk2(i) = t;
   c=c+1;
end

%     matrix43=circshift(key{2,3},[3 1]);
c=1;
    tk3=key{2,3};
for i = 2:size(tk3)      % Knuth shuffle in forward direction:
   
   w    = floor(rand * i)+1;   % 1 <= w <= i
   t    = tk3(w);
   tk3(w) = tk3(i);
   tk3(i) = t;
   c=c+1;
end
%     matrix44=circshift(key{2,4},[2 4]);
c=1;
    tk4=key{2,4};
for i = 2:size(tk4)      % Knuth shuffle in forward direction:
   
   w    = floor(rand * i)+1;   % 1 <= w <= i
   t    = tk4(w);
   tk4(w) = tk4(i);
   tk4(i) = t;
   c=c+1;
end
%     matrix45=circshift(key{2,5},[3 4]);
c=1;
    tk5=key{2,5};
for i =size(tk5):-1:2      % Knuth shuffle in back direction:
   
   w    = floor(rand * i)+1;   % 1 <= w <= i
   t    = tk5(w);
   tk5(w) = tk5(i);
   tk5(i) = t;
   c=c+1;
end
%     matrix46=circshift(key{2,6},[2 2]);
c=1;
    tk6=key{2,6};
for i =size(tk6):-1:2      % Knuth shuffle in forward direction:
   
   w    = floor(rand * i)+1;   % 1 <= w <= i
   t    = tk6(w);
   tk6(w) = tk6(i);
   tk6(i) = t;
   c=c+1;
end
%     matrix47=circshift(key{2,7},[1 1]);
c=1;
    tk7=key{2,7};
for i =size(tk7):-1:2      % Knuth shuffle in forward direction:
   
   w    = floor(rand * i)+1;   % 1 <= w <= i
   t    = tk7(w);
   tk7(w) = tk7(i);
   tk7(i) = t;
   c=c+1;
end
%     matrix48=circshift(key{2,8},[3 3]);
c=1;
    tk8=key{2,8};
for i =size(tk8):-1:2      % Knuth shuffle in forward direction:
   
   w    = floor(rand * i)+1;   % 1 <= w <= i
   t    = tk8(w);
   tk8(w) = tk8(i);
   tk8(i) = t;
   c=c+1;
end
    
    
%     matrix41 = key{2, 1};
%     matrix42 = key{2, 2};
%     matrix43 = key{2, 3};
%     matrix44 = key{2, 4};

%     %shifting
%     key{3, 1}(1, :) = key{2, 1}(1, :);
%     %key{3,1}(1,:)
%     key{3, 1}(2, :) = circshift(key{2, 1}(2, :), [1 1]);
%     %key{3,1}(2,:)
%     key{3, 1}(3, :) = circshift(key{2, 1}(3, :), [1 2]);
%     %key{3,1}(3,:)
%     key{3, 1}(4, :) = circshift(key{2, 1}(4, :), [1 3]);
%     %key{3,1}(4,:)
% 
%     key{3, 2}(1, :) = key{2, 2}(1, :);
%     key{3, 2}(2, :) = circshift(key{2, 2}(2, :), [1 1]);
%     key{3, 2}(3, :) = circshift(key{2, 2}(3, :), [1 2]);
%     key{3, 2}(4, :) = circshift(key{2, 2}(4, :), [1 3]);
% 
%     key{3, 3}(1, :) = key{2, 3}(1, :);
%     key{3, 3}(2, :) = circshift(key{2, 3}(2, :), [1 1]);
%     key{3, 3}(3, :) = circshift(key{2, 3}(3, :), [1 2]);
%     key{3, 3}(4, :) = circshift(key{2, 3}(4, :), [1 3]);
% 
%     key{3, 4}(1, :) = key{2, 4}(1, :);
%     key{3, 4}(2, :) = circshift(key{2, 4}(2, :), [1 1]);
%     key{3, 4}(3, :) = circshift(key{2, 4}(3, :), [1 2]);
%     key{3, 4}(4, :) = circshift(key{2, 4}(4, :), [1 3]);
% 
%     key_1{8, 1} = key{3, 1}; %Modified
%     key_1{8, 2} = key{3, 2}; %Modified
%     key_1{8, 3} = key{3, 3}; %Modified
%     key_1{8, 4} = key{3, 4}; %Modified
%     shiftmatrix1 = key{3, 1}; %Modified
%     shiftmatrix2 = key{3, 2}; %Modified
%     shiftmatrix3 = key{3, 3}; %Modified
%     shiftmatrix4 = key{3, 4}; %Modified
% 
%     key_1{9, 1} = [key_1{8, 1}(1, :), key_1{8, 1}(2, :), key_1{8, 1}(3, :), key_1{8, 1}(4, :)];
%     key_1{9, 2} = [key_1{8, 2}(:, 1)', flipdim(key_1{8, 2}(:, 2)', 2), key_1{8, 2}(:, 3)', ...
%                 flipdim(key_1{8, 2}(:, 4)', 2)];
%     key_1{9, 3} = [key_1{8, 3}(:, 1)', flipdim(key_1{8, 3}(:, 2)', 2), key_1{8, 3}(:, 3)', ...
%                 flipdim(key_1{8, 3}(:, 4)', 2)];
%     key_1{9, 4} = [key_1{8, 4}(1, :), key_1{8, 4}(2, :), key_1{8, 4}(3, :), key_1{8, 4}(4, :)];

    % For Final KEY K1
    %key_1{9, 1}
    K1=reshape(tk1.',1,[]);
    K2=reshape(tk2.',1,[]);
    K3=reshape(tk3.',1,[]);
    k1=xor(K1,K2);
    k11=not(xor(k1,K3));
    K4=reshape(tk4.',1,[]);
    k2=xor(K2,K3);
    k22=not(xor(k2,K4));
    K5=reshape(tk5.',1,[]);
    k3=xor(K3,K4);
    k33=not(xor(k3,K5));
    K6=reshape(tk6.',1,[]);
    k4=xor(K4,K5);
    k44=not(xor(k4,K6));
    K7=reshape(tk7.',1,[]);
    k5=xor(K5,K6);
    k55=not(xor(k5,K7));
    K8=reshape(tk8.',1,[]);
    k6=xor(K6,K7);
    k66=not(xor(k6,K8));
    
    keyy = [k11, k22, k33, k44,k55,k66];
    
     c=1;
    
for i = 2:size(keyy)      % Knuth shuffle in forward direction:
   
   w    = floor(rand * i)+1;   % 1 <= w <= i
   t    = keyy(w);
   keyy(w) = keyy(i);
   keyy(i) = t;
   c=c+1;
end
key1=keyy(1:16);
key2=keyy(17:32);
key3=keyy(33:48);
key4=keyy(49:64);
key5=keyy(65:80);
key6=keyy(81:96);
k111=xor(key1,key3);
k222=not(xor(key2,key4));
k333=xor(key3,key5);
k444=not(xor(key4,key6));
    
