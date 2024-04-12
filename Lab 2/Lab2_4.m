% [y, Fs] = audioread("TotalNumber . flac");
% soundsc(y, Fs);
% ro = [2, 0];
% lambda = [3, 5, 7, 8, 9];
% delta = mod(22102640, 7);
% delta_ro = mod(delta, length(ro)) + 1;
% delta_lamba = mod(delta, length(lambda)) +1;
% %according to the deltas, n1 and n2 are calculated
% n1 = 2;
% n2 = 3;

[my, F_s] = audioread("ID_record.flac");
soundsc(my, F_s);
t = 0:length(my) - 1 / F_s;
subplot(2, 1, 1);
plot(t, my)
title("Recording")

% start_time = 0.8 * 10^4; % Start time of the instance
% end_time = 1.4 * 10^4;   % End time of the instance
% 
% % Extract the instance into another .flac file
% instance_signal = my(t >= start_time & t <= end_time);
% audiowrite('n1_instance.flac', instance_signal, F_s);

[n_1, fs] = audioread("n1_instance.flac");
time = 0:length(n_1) - 1 / fs;
subplot(2,1,2);
plot(time, n_1);
title("n1 sample");

figure;
n1_new = fliplr(n_1);
my_new = my';
n1_newer = n1_new';

psi_new = convFUNC(my_new, fliplr(n1_newer));
subplot(3,1,1);
plot(abs(psi_new));
ylabel("\psi [x]");
xlabel("x");
subplot(3,1,2);
plot(abs(psi_new.^2));
ylabel("\psi [x]^2");
xlabel("x")
subplot(3,1,3);
plot(abs(psi_new.^4))
ylabel("\psi [x]^4");
xlabel("x");

