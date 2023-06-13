function a = fun(a)
% a = [bit_shuffle(a(9:16)), bit_shuffle(a(1:8))];
a=[~a(4),btch(a(1:3)),~a(8),btch(a(5:7)),~a(12),btch(a(9:11)),~a(16),btch(a(13:15))];
    
%      a=[btch(a(1:3)),a(4),btch(a(5:7)),a(8),btch(a(9:11)),a(12),btch(a(13:15)),a(16)];
end
