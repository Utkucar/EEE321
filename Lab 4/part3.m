Ts = 0.001;
t = 0:Ts:4;
k = 30;
x3_t = t .* (t >= 0) - (t - 3) .* ((t - 3) >= 0) - 3 * ((t - 3) >= 0);

M = 100;
c = 0.1;
kappa = 0.1;

% System is initially at rest
y = zeros(1,length(x3_t)+2);
y(2) = 0;
y(1) = 0;

% Backward approximation loop
for i = 3:length(x3_t)+2
    y(i) = (x3_t(i-2) + 2*M*y(i-1) + c*y(i-1) - M*y(i-2))/(M+c+kappa);
end

%plotting x3 and y
figure;
subplot(2, 1, 1);
plot(t, x3_t, 'r', 'LineWidth', 1.5);
xlabel("n");
ylabel("x_3[n]");
title("Discretized approximation  of x(t)");

subplot(2, 1, 2);
plot(t, y(3:end), 'g', 'LineWidth', 1.5);
xlabel("n");
ylabel("y[n]");
title("Discretized approximation y(t)");

%plotting the coefficients
figure;
x_coeff = FSAnalysis(x3_t, k);
y_coeff = FSAnalysis(y, k);

subplot(2, 2, 1);
stem(-k:k, real(x_coeff), 'b', 'LineWidth', 1.5);
xlabel('Coefficient Index (k)');
xlim([-30,30]);
ylabel('Real Part');
title('Real Part of Fourier Series Coefficients for x3(t)');

subplot(2, 2, 2);
stem(-k:k, imag(x_coeff), 'r', 'LineWidth', 1.5);
xlabel('Coefficient Index (k)');
xlim([-30,30]);
ylabel('Imaginary Part');
title('Imaginary Part of Fourier Series Coefficients for x3(t)');

subplot(2, 2, 3);
stem(-k:k, real(y_coeff), 'b', 'LineWidth', 1.5);
xlabel('Coefficient Index (k)');
xlim([-30,30]);
ylabel('Real Part');
title('Real Part of Fourier Series Coefficients for y(t)');

subplot(2, 2, 4);
stem(-k:k, imag(y_coeff), 'r', 'LineWidth', 1.5);
xlabel('Coefficient Index');
xlim([-30,30]);
ylabel('Imaginary Part (k)');
title('Imaginary Part of Fourier Series Coefficients for y(t)');
