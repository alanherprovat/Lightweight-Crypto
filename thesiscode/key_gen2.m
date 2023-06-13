function [k11, k22, k33, k44,k55,k66,k77,k88] = key_gen2(bin_key1)
    %making a cell
    key = cell(5, 8);
    
        c=1;
for i = 2:size(bin_key1)      % Knuth shuffle in forward direction:
   
   w    = floor(rand * i)+1;   % 1 <= w <= i
   t    = bin_key1(w);
   bin_key1(w) = bin_key1(i);
   bin_key1(i) = t;
   c=c+1;
end

    %first layer of f function
    key{1, 1} = f_fun(bin_key1(1:16)); %bin_key(1:16);
    key{1, 2} = f_fun(bin_key1(17:32)); %bin_key(17:32);
    key{1, 3} = f_fun(bin_key1(33:48)); %bin_key(33:48);
    key{1, 4} = f_fun(bin_key1(49:64)); %bin_key(49:64);
    key{1, 5} = f_fun(bin_key1(65:80)); %bin_key(65,80);
    key{1, 6} = f_fun(bin_key1(81:96)); %bin_key(81,96);
    key{1, 7} = f_fun(bin_key1(97:112)); %bin_key(97,112);
    key{1, 8} = f_fun(bin_key1(113:128)); %bin_key(113,124);
% 
%     key{1, 1} = fun(bin_key1(1:16)); %bin_key(1:16);
%     key{1, 2} = fun2(bin_key1(17:32)); %bin_key(17:32);
%     key{1, 3} = fun(bin_key1(33:48)); %bin_key(33:48);
%     key{1, 4} = f_fun(bin_key1(49:64)); %bin_key(49:64);
%     key{1, 5} = f_fun(bin_key1(65:80)); %bin_key(65,80);
%     key{1, 6} = fun2(bin_key1(81:96)); %bin_key(81,96);
%     key{1, 7} = fun(bin_key1(97:112)); %bin_key(97,112);
%     key{1, 8} = fun2(bin_key1(113:128)); %bin_key(113,124);
    

    bin_key=[key{1,1},key{1,2},key{1,3},key{1,4},key{1,5},key{1,6},key{1,7},key{1,8}];
    
    
    % generating a matrix of each 16bit int 4*4

    key{2, 1}(1, :) = bin_key(1:4);
    key{2, 1}(2, :) = bin_key(5:8);
    key{2, 1}(3, :) = bin_key(9:12);
    key{2, 1}(4, :) = bin_key(13:16);
    
    key{2,1}=fliplr(key{2,1});
    
    key{2, 2}(1, :) = bin_key(1:4);
    key{2, 2}(2, :) = bin_key(5:8);
    key{2, 2}(3, :) = bin_key(9:12);
    key{2, 2}(4, :) = bin_key(13:16);
    
    key{2,2}=flipud(key{2,2});
    
    key{2, 3}(1, :) = bin_key(1:4);
    key{2, 3}(2, :) = bin_key(5:8);
    key{2, 3}(3, :) =bin_key(9:12);
    key{2, 3}(4, :) = bin_key(13:16);
    
    key{2,3}=fliplr(key{2,3});
    
    key{2, 4}(1, :) = bin_key(1:4);
    key{2, 4}(2, :) = bin_key(5:8);
    key{2, 4}(3, :) = bin_key(9:12);
    key{2, 4}(4, :) = bin_key(13:16);
    
    key{2,4}=flipud(key{2,4});
    
    key{2, 5}(1, :) = bin_key(1:4);
    key{2, 5}(2, :) = bin_key(5:8);
    key{2, 5}(3, :) = bin_key(9:12);
    key{2, 5}(4, :) = bin_key(13:16);
    
    key{2,5}=fliplr(key{2,5});
    
    key{2, 6}(1, :) = bin_key(1:4);
    key{2, 6}(2, :) = bin_key(5:8);
    key{2, 6}(3, :) = bin_key(9:12);
    key{2, 6}(4, :) = bin_key(13:16);
    
    key{2,6}=flipud(key{2,6});
    
    key{2, 7}(1, :) = bin_key(1:4);
    key{2, 7}(2, :) = bin_key(5:8);
    key{2, 7}(3, :) = bin_key(9:12);
    key{2, 7}(4, :) = bin_key(13:16);
    
    key{2,7}=fliplr(key{2,7});
    
    key{2, 8}(1, :) = bin_key(1:4);
    key{2, 8}(2, :) = bin_key(5:8);
    key{2, 8}(3, :) = bin_key(9:12);
    key{2, 8}(4, :) = bin_key(13:16);
    
    key{2,8}=flipud(key{2,8});
   
    
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


    K1=reshape(tk1.',1,[]);
    K3=reshape(tk3.',1,[]);
    K2=reshape(tk2.',1,[]);
    K4=reshape(tk4.',1,[]);
    K5=reshape(tk5.',1,[]);
    K7=reshape(tk7.',1,[]);
    K6=reshape(tk6.',1,[]);
    K8=reshape(tk8.',1,[]);
    
    K1=fun(K1);
    K2=fun2(K2);
    K3=fun(K3);
    K4=fun2(K4);
    K5=fun(K5);
    K6=fun2(K6);
    K7=fun(K7);
    K8=fun2(K8);
    
    
    
  
%     k11=xor(K1,K3);
%     
%     k22=not(xor(K2,K4));
%     k22=xor(k11,k22);
%     k11=not(xor(k11,k22));
%     
%     k33=xor(K5,K7);
%    
%     k44=not(xor(K6,K8));
%     k44=xor(k33,k44);
%     
%     k33=not(xor(k44,k33));
%     
%     b=[k11,k22,k33,k44];
%     
%     key{3, 1}(1, :) = b(1:8);
%     key{3, 1}(2, :) = b(9:16);
%     key{3, 1}(3, :) = b(17:24);
%     key{3, 1}(4, :) = b(25:32);
%     key{3, 1}(5, :) = b(33:40);
%     key{3, 1}(6, :) = b(41:48);
%     key{3, 1}(7, :) = b(49:56);
%     key{3, 1}(8, :) = b(57:64);
%    
%     c=1;
%     tkk=key{3,1};

 tkk=[K1, K2, K3,K4, K5, K6, K7, K8];
 
for i =size(tkk):-1:2      % Knuth shuffle in reverse direction:
   
   w    = floor(rand * i)+1;   % 1 <= w <= i
   t    = tkk(w);
   tkk(w) = tkk(i);
   tkk(i) = t;
   c=c+1;
end
b=reshape(tkk.',1,[]);

%     k11 = fun(b(1:16));
%     k22 = fun2(b(17:32));
%     k33= fun(b(33:48));
%     k44= fun2(b(49:64));
%     k55 = fun(b(65:80));
%     k66 = fun2(b(81:96));
%     k77 = fun(b(97:112));
%     k88= fun2(b(113:128));
    

k11=b(1:16);
k22=b(17:32);
k33= b(33:48);
k44=b(49:64);
k55=b(65:80);
k66=b(81:96);
k77=b(97:112);
k88=b(113:128);

    
