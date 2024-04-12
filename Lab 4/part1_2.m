Ts = 0.001;     % Sampling period
t = 0:Ts:1;     % fundamental period = 1s
x1_t = 8*cos(10*pi*t) + 20*sin(6*pi*t) - 11*cos(30*pi*t);
k = 30;         
fsCoeffs_x1 = FSAnalysis(x1_t, k);

% Plotting
figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_x1), 'b', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
ylabel('Re[a_k]');
title('Real Part of Estimated Fourier Series Coefficients for x_1(t)');
grid on;

subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_x1), 'r', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
ylabel('Im[a_k]');
title('Imaginary Part of Estimated Fourier Series Coefficients for x_1(t)');
grid on;

t2 = -1:Ts:1; %fundamental period = 2s starting from -1 to 1
x2_t = exp(-abs(t2));
fsCoeffs_x2 = FSAnalysis(x2_t, k);

% Plot real and imaginary parts of the estimated Fourier series coefficients
figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_x2), 'b', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
ylabel('Re[a_k]');
title('Real Part of Estimated Fourier Series Coefficients for x_2(t)');
grid on;

subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_x2), 'r', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
ylabel('Im[a_k]');
title('Imaginary Part of Estimated Fourier Series Coefficients for x_2(t)');
grid on;

