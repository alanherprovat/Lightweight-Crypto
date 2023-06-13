function [Data1,p]=fwknuthsuffle(Data1)
c=1;
[r,col]=size(Data1);
for j=1:r
for i = 2:col    % Knuth shuffle in forward direction:
   p(c)=rand;
   w    = floor(p(c) * i)+1;   % 1 <= w <= i
   t    = Data1(j,w);
   Data1(j,w) = Data1(j,i);
   Data1(j,i) = t;
   c=c+1;
end
end
