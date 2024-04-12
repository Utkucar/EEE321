% Impulse response of the system
h = [1, -2, 1];

% Check if the system is invertible
if sum(abs(h)) < Inf
    fprintf('The system is invertible.\n');
    
    % Deconvolution to find the inverse system
    h_inverse = deconv([1 0], h);
    convResult = conv(h, h_inverse);

    % Plot the output sequences y1[n] and y2[n] for the input sequences x1[n] and x2[n]
    y1 = filter(h, 1, x1);
    y2 = filter(h, 1, x2);

    figure;
    subplot(2, 1, 1);
    stem(n, y1, 'b', 'filled');
    title('Output Sequence y1[n] for x1[n]');
    xlabel('n');
    ylabel('y1[n]');

    subplot(2, 1, 2);
    stem(n, y2, 'r', 'filled');
    title('Output Sequence y2[n] for x2[n]');
    xlabel('n');
    ylabel('y2[n]');

    % Check for causality and memory of the system
    if all(h_inverse == 0)
        fprintf('The inverse system is causal.\n');
    else
        fprintf('The inverse system is not causal.\n');
    end

    if any(h_inverse ~= 0)
        fprintf('The inverse system has memory.\n');
    else
        fprintf('The inverse system is memoryless.\n');
    end
else
    fprintf('The system is not invertible.\n');
end
