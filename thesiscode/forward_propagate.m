function inputs=forward_propagate(network, row)
	inputs = row;
    [r,c]=size(network);
    for i=1:c
	     new_inputs = [];
	        for j=1:4
            activation = activate(network{i}(j,:), inputs);
			neuron = transfer(activation);
			new_inputs=neuron;
		    inputs = new_inputs;
        end
        
    end
