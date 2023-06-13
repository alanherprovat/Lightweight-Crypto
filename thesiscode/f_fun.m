function a = f_fun(a)
%disp('initial a');
%disp(a)P_fun(a(1:4))
a=[P_fun(a(1:4)),Q_fun(a(5:8)),P_fun(a(9:12)),Q_fun(a(13:16))];
%tem=[a(15:16),a(1:2)];
a=[Q_fun(a(1:4)),P_fun(a(5:8)),Q_fun(a(9:12)),P_fun(a(13:16))];
% a=[Q_fun(a(1:4)),P_fun(a(5:8)),Q_fun(a(9:12)),P_fun(a(13:16))];


end