t = 0:0.0001:1.5;
mu = -1000;
phi = 0;
f0 = 2500;
x5 = cos(2 * pi * mu * t.^2 + 2 * pi * f0 * t + phi);
plot(t, x5);
sound(x5);
