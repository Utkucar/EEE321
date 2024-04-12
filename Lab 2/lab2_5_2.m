[audio_array,F_audio] = audioread("TotalNumber . flac");
[filter, F_filter] = audioread("2. flac");
audio_len = length(audio_array);

for i = 0:9
    SNR= 0.01-i*0.001;
        p_signal = (1/audio_len) * sum(audio_array.^2);
    p_noise = p_signal / SNR;
    rng(5)
    awgn = sqrt(p_noise) .* randn([audio_len, 1]);

    noisy_audio = awgn + audio_array;
end

    t_noisy_audio = noisy_audio';
    t_filter = filter';

for a = 1:10
    %correlation part
    
    detect = convFUNC(t_filter, t_noisy_audio(a));
    abs_detect = abs(detect);
    subplot(5,2,a)
    plot(abs_detect);
end