N_range = 100:300:10000;
t = -10000:0.001:10000;


subplot(5, 1, 1);
%a = 0;                      %perfect integrator
delta = zeros(size(t));
delta(t == 0) = 1;
h = cumsum(delta);
sum_arr = sumElements(h, N_range);
stem(N_range, sum_arr);
title("BIBO properties of different a values");

subplot (5, 1, 2);
a = 0.05;                   %converges to 2 * 10^5
f_2 = exp(-t * a);
h = f_2 .* heaviside(t);
sum_arr = sumElements(h, N_range);
stem(N_range, sum_arr);
title("a = 0.05");

subplot(5, 1, 3);
a = 0.1;                    %converges to 10^5
f_3 = exp(-t * a);
h = f_3 .* heaviside(t);
sum_arr = sumElements(h,N_range);
stem(N_range, sum_arr);
title("a = 0.1");

subplot(5, 1, 4);
a = 0.25;                    %converges to 4 * 10^4
f_4 = exp(-t * a);
h = f_4 .* heaviside(t);
sum_arr = sumElements(h,N_range);
stem(N_range, sum_arr);
title("a = 0.25");

subplot(5, 1, 5);
a = 0.5;                    %converges to 2* 10^4
f_5 = exp(-t * a);
h = f_5 .* heaviside(t);
sum_arr = sumElements(h,N_range);
stem(N_range, sum_arr);
title("a = 0.5");

