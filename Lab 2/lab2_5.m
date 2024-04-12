[audio_array, Fs] = audioread("TotalNumber . flac");
% soundsc(audio_array, Fs);
audio_len = length(audio_array);

p_signal = (1/audio_len) * sum(audio_array.^2);

disp(p_signal);

SNR = 10;

p_noise = p_signal / 10;

display(p_noise);

rng(5);
awgn = sqrt(p_noise) .* randn([audio_len, 1]);

noisy_audio = audio_array + awgn;

% soundsc(noisy_audio, Fs); pause(10);
subplot(3, 1, 1);
plot(noisy_audio);
title("SNR = 10");
xlabel("t");
ylabel("noisy audio");

%SNR = 0.1
p_noise_2 = p_signal / 0.1;
display(p_noise_2);
rng(5);
awgn_2 = sqrt(p_noise_2) .* randn([audio_len, 1]);

noisy_audio_2 = audio_array + awgn_2;

% soundsc(noisy_audio_2, Fs); pause(10);
subplot(3, 1, 2);
plot(noisy_audio_2);
title("SNR = 0.1");
xlabel("t");
ylabel("noisy audio");


%SNR = 0.001
p_noise_3 = p_signal / 0.001;
display(p_noise_3);
rng(5);
awgn_3 = sqrt(p_noise_3) .* randn([audio_len, 1]);

noisy_audio_3 = audio_array + awgn_3;

% soundsc(noisy_audio_3, Fs);
subplot(3, 1, 3);
plot(noisy_audio_3);
title("SNR = 0.001");
xlabel("t");
ylabel("noisy audio");
