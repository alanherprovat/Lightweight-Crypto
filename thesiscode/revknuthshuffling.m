function Dec=revknuthshuffling(Dec,maincount)
c=65280;
[r,col]=size(Dec);
for j=r:-1:1
for i = col:-1:2    % Knuth shuffle in forward direction:
   
   w    = floor(maincount(c) * i)+1;   % 1 <= w <= i
   t    = Dec(j,w);
%    fprintf("%d\n",Dec(j,w));
   Dec(j,w) = Dec(j,i);
   Dec(j,i) = t;
   c=c-1;
end
end
% for i = n:-1:2   % Knuth shuffle in backward direction:
%    w    = floor(p(c) * i)+1;   % 1 <= w <= i
%    t    = l(w);
%    l(w) = l(i);
%    l(i) = t;
%    c=c-1;
% end