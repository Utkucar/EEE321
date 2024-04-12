t = 0:0.0001:3;
% a = 1;
a = 2;
% a = 3;
x3 = exp(-(a ^ 2 + 2) * t) .* cos(2 * pi * 440 * t); 
plot(t, x3);
xlim([0 0.1]);
soundsc(x3);