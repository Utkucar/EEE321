t = -10:0.1:10;
delta = zeros(size(t));
delta(t == 0) = 1;

subplot(5, 2, 1);
f_1 = cumsum(delta);                   %impulse response for a = 0
h = f_1 .* heaviside(t);
stem(t, h);
title("discretized impulse responses");
xlabel("n");
ylabel("h[n]");

subplot(5, 2, 3);
f_2 = exp(-t * 0.05);
h = f_2 .* heaviside(t);
stem(t, h);
title("a = 0.05");
xlabel("n");
ylabel("h[n]");

subplot(5, 2, 5);
f_3 = exp(-t * 0.1);
h = f_3 .* heaviside(t);
stem(t, h);
title("a = 0.1");
xlabel("n");
ylabel("h[n]");

subplot(5, 2, 7);
f_4 = exp(-t * 0.25);
h = f_4 .* heaviside(t);
stem(t, h);
title("a = 0.25");
xlabel("n");
ylabel("h[n]");

subplot(5, 2, 9);
f_5 = exp(-t * 0.5);
h = f_5 .* heaviside(t);
stem(t, h);
title("a = 0.5");
xlabel("n");
ylabel("h[n]");

%by hand calculation we found the step response to be (1 - exp(-at))/a

subplot(5, 2, 2)
f_1 = cumsum(heaviside(t));     %does not converge
s = f_1 .* heaviside(t);
stem(t, s);
title("discretized step responses")
xlabel("n");
ylabel("s[n]");

subplot(5, 2, 4)
a = 0.05;           %converges to 20 
f_2 = (1 - exp(-a * t)) / a;
s = f_2 .* heaviside(t);
stem(t, s);
title("a = 0.05");
xlabel("n");
ylabel("s[n]");

subplot(5, 2, 6)
a = 0.1;            %converges to 10 
f_3 = (1 - exp(-a * t)) / a;
s = f_3 .* heaviside(t);
stem(t, s);
title("a = 0.1");
xlabel("n");
ylabel("s[n]");

subplot(5, 2, 8)
a = 0.25;           %converges to 4
f_4 = (1 - exp(-a * t)) / a;
s = f_4 .* heaviside(t);
stem(t, s);
title("a = 0.25");
xlabel("n");
ylabel("s[n]");

subplot(5, 2, 10)
a = 0.5;            %converges to 2
f_5 = (1 - exp(-a * t)) / a;
s = f_5 .* heaviside(t);
stem(t, s);
title("a = 0.5");
xlabel("n");
ylabel("s[n]");