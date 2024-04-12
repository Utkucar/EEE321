% Difference equation coefficients
b = [1, -2, 1];

delta = [zeros(1, 5), 1, zeros(1, 5)]; % Impulse at n=0

impulse_response_manual = filter(b, 1, delta);

% Generate the impulse response using MATLAB's filter function
n = -5:5;
impulse_response_matlab = filter(b, 1, delta);

% Plot the impulse responses
subplot(2, 1, 1);
stem(n, impulse_response_manual, 'b', 'filled');
title('Impulse Response (Manually Derived)');
xlabel('n');
ylabel('h[n]');

subplot(2, 1, 2);
stem(n, impulse_response_matlab, 'r', 'filled');
title('Impulse Response (MATLAB Derived)');
xlabel('n');
ylabel('h[n]');

b = [1, -2, 1]; 

n = 0:30;
x1 = 8*(heaviside(n) - heaviside(n-4)) - 4*(heaviside(n-4) - heaviside(n-13));
x2 = (0.3).^n .* heaviside(n);

% Apply the difference equation to obtain output sequences
y1 = filter(b, 1, x1);
y2 = filter(b, 1, x2);

N_range = 0:5;

% Investigate BIBO stability using sumElements function
sum_y1 = sumElements(y1, N_range);
sum_y2 = sumElements(y2, N_range);

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

% Plot the sum of absolute values for each N
figure;
subplot(2, 1, 1);
stem(N_range, sum_y1, 'b', 'filled');
title('Sum of Absolute Values for y1[n]');
xlabel('N');
ylabel('Sum of Absolute Values');

subplot(2, 1, 2);
stem(N_range, sum_y2, 'r', 'filled');
title('Sum of Absolute Values for y2[n]');
xlabel('N');
ylabel('Sum of Absolute Values');
