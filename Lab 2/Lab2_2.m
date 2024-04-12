% Define the time range
t = 0:25; % Adjust the time range as needed

% Initialize the function array
x = zeros(size(t));

% Set the values for the function
for i = 1:length(t)
    if t(i) < 2 % Before the delay
        x(i) = 0;
    else
        % Compute the index within the repeating pattern
        idx_within_pattern = mod(t(i) - 2, 6);
        
        % Set the values based on the pattern
        if idx_within_pattern < 3
            x(i) = 1;
        else
            x(i) = 0;
        end
    end
end

% Call ConvFUNC to compute the convolution of x with itself
y = convFUNC(x, x);

% Define the time range for y
ty = 0:(length(x) + length(x) - 2); % Length of convolution result

% Create a subplot with two rows and one column
subplot(2, 1, 1); % Plot in the first row

% Plot the function x
stem(t, x);
xlabel('n');
ylabel('x[n]');
title('x[n]');

% Plot the function y in the second row
subplot(2, 1, 2); % Plot in the second row

% Plot the convolution y
stem(ty, y);
xlabel('n');
ylabel('y[n]');
title('Convolution of x with itself');
