Ts = 0:0.0001:3;
f = 440;           
x1 = sin(2 * pi * f * Ts);
plot(Ts, x1);
xlim([0 0.01]);
xlabel("Time");
 
% c = sin(2 * pi * 440 * Ts);
% c_1 = sin(2 * pi * 880 * Ts);
% c_2 = sin(2 * pi * 1760 * Ts);
% sound(c); pause(6); sound(c_1); pause(6); sound(c_2);
clf;
s = sin(2 * pi * 440 * Ts) + sin(2 * pi * 554 * Ts) + sin(2 * pi * 659 * Ts);
plot(Ts, s);
xlim([0 0.01]);
soundsc(s);