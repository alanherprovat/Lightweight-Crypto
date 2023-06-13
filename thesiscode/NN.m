function output=NN(row)
network = initialize_network(4, 4, 4);
% disp(network);
% row=[1 1 0 1];
output = forward_propagate(network, row);
output=round(output-0.18);
