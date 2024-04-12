function [sum_array] = sumElements(h, N_range)
    % Initialize the sum array
    sum_array = zeros(1, length(N_range));
    
    % Get the midpoint of the impulse response
    mid_point = floor(length(h) / 2) + 1;

    % Calculate the sum of absolute values for each N
    for i = 1:length(N_range)
        N = N_range(i);
        lower_bound = max(1, mid_point - N);
        upper_bound = min(length(h), mid_point + N);
        sum_array(i) = sum(abs(h(lower_bound:upper_bound)));
    end
end