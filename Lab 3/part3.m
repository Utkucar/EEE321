% Define the input sequences
n = 0:30;
x1 = 8*(heaviside(n) - heaviside(n-4)) - 4*(heaviside(n-4) - heaviside(n-13));
x2 = (0.3).^n .* heaviside(n);

a_values = [0, 0.05, 0.1, 0.25, 0.5];

% Initialize arrays to store the output sequences
y1 = zeros(length(n), length(a_values));
y2 = zeros(length(n), length(a_values));

% Calculate the output sequences for different values of a
for i = 1:length(a_values)
    a = a_values(i);
    
    y1_temp = zeros(size(n));
    for k = 2:length(n)
        y1_temp(k) = (1-a)*x1(k) + a*y1_temp(k-1);
    end
    y1(:,i) = y1_temp;

    y2_temp = zeros(size(n));
    for k = 2:length(n)
        y2_temp(k) = (1-a)*x2(k) + a*y2_temp(k-1);
    end
    y2(:,i) = y2_temp;
end

% The ideal outputs for a=0
y1_ideal = zeros(size(y1));
y2_ideal = zeros(size(y2));
for k = 2:length(n)
    y1_ideal(k,:) = y1_ideal(k-1,:) + x1(k);
    y2_ideal(k,:) = y2_ideal(k-1,:) + x2(k);
end

% Calculate the differences
E1 = abs(y1_ideal - y1);
E2 = abs(y2_ideal - y2);

figure;

for i = 1:length(a_values)
    subplot(length(a_values), 2, 2*i - 1);
    stem(n, E1(:,i));
    title(['Difference for a = ', num2str(a_values(i)), ' (System 1)']);
    xlabel('n');
    ylabel('|E1[n]|');

    subplot(length(a_values), 2, 2*i);
    stem(n, E2(:,i));
    title(['Difference for a = ', num2str(a_values(i)), ' (System 2)']);
    xlabel('n');
    ylabel('|E2[n]|');
end

figure;
    subplot(2, 1, 1);
    stem(x1);
    title("x1");
    xlabel("n");
    ylabel("x1[n]");

    subplot(2, 1, 2);
    stem(x2);
    title("x2");
    xlabel("n");
    ylabel("x2[n]");

