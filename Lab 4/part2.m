% Define the signal x3(t)
Ts = 0.001;
t = 0:Ts:4;
k = 30;
x3_t = t .* (t >= 0) - (t - 3) .* ((t - 3) >= 0) - 3 * ((t - 3) >= 0);

% Compute Fourier series coefficients of x3(t)
fsCoeffs_x3 = FSAnalysis(x3_t, k);

% Plot real and imaginary parts of Fourier series coefficients for x3(t)
figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_x3), 'b', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
xlim([-30,30]);
ylabel('Re[a_k]');
title('Real Part of Fourier Series Coefficients for x_3(t)');
grid on;
subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_x3), 'r', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
xlim([-30,30]);
ylabel('Im[a_k]');
title('Imaginary Part of Fourier Series Coefficients for x_3(t)');
grid on;

%a) z1(t) = x3(-t)
z1_t = fliplr(x3_t);
fsCoeffs_z1 = FSAnalysis(z1_t, k);

figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_z1), 'b', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
xlim([-30,30]);
ylabel('Re[a_k]');
title('Real Part of Fourier Series Coefficients for z_1(t)');
grid on;

subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_z1), 'r', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
xlim([-30,30]);
ylabel('Im[a_k]');
title('Imaginary Part of Fourier Series Coefficients for z_1(t)');
grid on;

% b) z2(t) = d x3(t)/dt
z2_t = diff(x3_t) / Ts;  
fsCoeffs_z2 = FSAnalysis(z2_t, k);
figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_z2), 'b', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
xlim([-30,30]);
ylabel('Re[a_k]');
title('Real Part of Fourier Series Coefficients for z_2(t)');
grid on;
subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_z2), 'r', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
xlim([-30,30]);
ylabel('Im[a_k]');
title('Imaginary Part of Fourier Series Coefficients for z_2(t)');
grid on;

% c) z3(t) = x3(t + 2)
z3_t = (t + 2) .* (t + 2 >= 0) - (t - 1) .* ((t - 1) >= 0) - 3 * ((t - 1) >= 0);
fsCoeffs_z3 = FSAnalysis(z3_t, k);
figure; 
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_z3), 'b', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
xlim([-30,30]);
ylabel('Re[a_k]');
title('Real Part of Fourier Series Coefficients for z_3(t)');
grid on;
subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_z3), 'r', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
xlim([-30,30]);
ylabel('Im[a_k]');
title('Imaginary Part of Fourier Series Coefficients for z_3(t)');
grid on;

% d) z4(t) = Even{x3(t)}
z4_t = zeros(1, length(x3_t));

for i = 1:length(x3_t)
    z4_t(i) = (x3_t(i) + z1_t(i))/2;
end

fsCoeffs_z4 = FSAnalysis(z4_t, k);
figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_z4), 'b', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
xlim([-30,30]);
ylabel('Re[a_k]');
ylim([-1,1.5]);
title('Real Part of Fourier Series Coefficients for z_4(t)');
grid on;

subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_z4), 'r', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
xlim([-30,30]);
ylabel('Im[a_k]');
ylim([-1,1.5]);
title('Imaginary Part of Fourier Series Coefficients for z_4(t)');
grid on;

% e) z5(t) = x3^2(t)
z5_t = x3_t.^2;  % Square the signal
fsCoeffs_z5 = FSAnalysis(z5_t, k);
figure;
subplot(2, 1, 1);
stem(-k:k, real(fsCoeffs_z5), 'b', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
xlim([-30,30]);
ylabel('Re[a_k]');
title('Real Part of Fourier Series Coefficients for z_5(t)');
grid on;

subplot(2, 1, 2);
stem(-k:k, imag(fsCoeffs_z5), 'r', 'LineWidth', 1.5);
xlabel('Coefficient (k) Index');
xlim([-30,30]);
ylabel('Im[a_k]');
title('Imaginary Part of Fourier Series Coefficients for z_5(t)');
grid on;

