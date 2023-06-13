function trans= transfer(activation)
 [r,c]=size(activation);
 for i=1:c
	trans(i)=1.0 / (1.0 + exp(-activation(i)));
 end