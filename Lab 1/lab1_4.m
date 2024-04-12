t = 0:0.0001:2;
% x4 = cos(2* pi * 10 * t) .* cos(2 * pi * 1 * t);
x4 = 1/2 * (cos(2 * pi * 20 * t) + cos(2 * pi * 10 * t));
plot(t, x4);
xlim([0 0.1]);
sound(x4);