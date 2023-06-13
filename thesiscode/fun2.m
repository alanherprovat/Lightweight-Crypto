function a = fun2(a)
% a=[a(1),btch(a(2:4)),a(5),btch(a(6:8)),a(9),btch(a(10:12)),a(13),btch(a(14:16))];  
 a=[btch2(a(1:3)),~a(4),btch2(a(5:7)),~a(8),btch2(a(9:11)),~a(12),btch2(a(13:15)),~a(16)];
end
