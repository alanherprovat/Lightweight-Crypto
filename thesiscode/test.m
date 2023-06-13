% Define the 4-bit S-box
S = [0 6 12 10 5 11 9 14 15 8 3 13 4 7 1 2];

% Construct a set of input-output pairs for the S-box
num_pairs = 16;
pairs = zeros(num_pairs, 8);
for i = 1:num_pairs
    x = dec2bin(i-1, 4) - '0'; % convert i-1 to binary
    y = dec2bin(S(i), 4) - '0'; % apply S-box to i
    pairs(i,:) = [x y];
end


% Calculate the bias of each input bit and each output bit
bias_in = zeros(1, 4);
bias_out = zeros(1, 4);
for i = 1:4
    bias_in(i) = sum(pairs(:, i) == 1) - sum(pairs(:, i) == 0);
    bias_in(i) = bias_in(i) / num_pairs;
    bias_out(i) = sum(pairs(:, i+4) == 1) - sum(pairs(:, i+4) == 0);
    bias_out(i) = bias_out(i) / num_pairs;
end

% Calculate the correlation between input bits and output bits
corr_table = zeros(16, 16);
for i = 1:16
    for j = 1:16
        x = dec2bin(i-1, 4) - '0';
        y = dec2bin(j-1, 4) - '0';
        sum_xy = sum(bitxor(x, y)); % number of different bits
        count = sum(bitand(bitxor(x, pairs(:, 1:4)), bitxor(y, pairs(:, 5:8))) == 0);
        corr_table(i, j) = 2*sum(count) - num_pairs;
        corr_table(i, j) = corr_table(i, j) / num_pairs;
    end
end


% Find the linear approximation with the highest bias
% Find the linear approximation with the highest bias
best_corr = 0;
for i = 1:16
    for j = 1:16
        if i ~= 1 || j ~= 1 % skip the all-0 input and output
            corr = abs(corr_table(i, j));
             bias = abs(bias_in(bi2de(transpose(bitget(i-1, 1:4)), 'int8')+1) - bias_out(bi2de(trnspose(bitget(j-1, 1:4)), 'int8')+1));
            if corr * bias > best_corr
                best_corr = corr * bias;
                best_i = i;
                best_j = j;
            end
        end
    end
end



% Print the results
disp('Input bias:');
disp(bias_in);
disp('Output bias:');
disp(bias_out);
disp('Correlation table:');
disp(corr_table);
disp('Best linear approximation:');
fprintf('%s -> %s, correlation = %f, bias = %f\n', ...
    dec2bin(best_i-1, 4), dec2bin(best_j-1, 4), corr_table(best_i, best_j), best_corr);
