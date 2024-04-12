t = -0.5:0.01:0.5;
delta = zeros(size(t));
delta(t == 0) = 1; 

subplot(2, 1, 1);
i_response = cumsum(delta);
stem(t, i_response);
title("Discretized impulse response of the perfect integrator");
xlabel("n / 10");
ylabel("h[n]");

subplot(2, 1, 2);
u_response = cumsum(heaviside(t));
stem(t, u_response);
title("Discretized step response of the perfect integrator");
xlabel("n / 10");
ylabel("s[n]");