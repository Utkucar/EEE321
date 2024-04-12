% defining x1(t)
Ts = 0.001;
t=0:Ts:1;
x1_t = 8*cos(10*pi*t) + 20*sin(6*pi*t) - 11*cos(30*pi*t);

left_side = sum(abs(x1_t).^2) * Ts;
%flooring to allow for errors
left_side = floor(left_side);

k = 30;
fsCoeffs_x1 = FSAnalysis(x1_t, k);

% Compute total power in frequency domain
right_side = sum(abs(fsCoeffs_x1).^2);
%again, flooring for the errors
right_side = floor(right_side);

if abs(left_side - right_side) == 0
    disp("sum of coefficients: " + right_side)
    disp("sum of the square: " + left_side);
    disp("Parseval's relation holds.");
else
    disp(left_side - right_side);
    disp("sum of coefficients: " + right_side)
    disp("sum of the square: " + left_side);
    disp("Parseval's relation does not hold.");
end
