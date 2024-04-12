% Define the time array τ and sampling interval Si
Si = 0.25; % Sampling interval
tau = -10:Si:10;
tau_y = -20:Si:20; % Extend the range for convolution result

% Define the unit-step functions u(t)
u = @(t) (t >= 0);

% Define ξ(t) = u(t+5) - u(t-5)
xi_t = @(t) u(t+5) - u(t-5);

% Define η(t) = u(t+2.5) - u(t-2.5)
eta_t = @(t) u(t+2.5) - u(t-2.5);
xi_tau = xi_t(tau);
eta_tau = eta_t(tau);
eta_tau_flipped = eta_t(-tau);

psi_tau = convFUNC(xi_tau, eta_tau);

figure;

for ii = 1:length(tau)
    % Update the plot
    subplot(2, 2, 1);
    plot(tau, xi_tau, 'b', 'LineWidth', 1.5);
    title('\xi(\tau)');
    xlabel('\tau');
    ylabel('\xi(\tau)');
    xlim([tau(1), tau(end)]);
    ylim([-0.25, 1.25]);
    
    subplot(2, 2, 2);
    plot(tau, eta_tau, 'g', 'LineWidth', 1.5);
    title('\eta(\tau)');
    xlabel('\tau');
    ylabel('\eta(\tau)');
    xlim([tau(1), tau(end)]); 
    ylim([-0.25, 1.25]);
    
    subplot(2, 2, 3);

    plot(tau, xi_tau, 'b', 'LineWidth', 1);
    hold on;
    plot(tau - 20 + ii, eta_tau_flipped, 'g', 'LineWidth', 1.5);  
    hold off;
    
    title('Sliding \eta(\tau)');
    xlabel('\tau');
    xlim([-20, 20])
    ylabel('\eta(\tau)');
    ylim([-0.5, 1.5]); % Set y-axis limits
    
    subplot(2, 2, 4);
 
    plot(tau_y(1:4:2*ii-1), psi_tau(1:4:2*ii-1) / 4, 'r', 'LineWidth', 1.5);
    title('\psi(\tau)');
    xlabel('\tau');
    ylabel('\psi(\tau)');
    xlim([-20, 20]); % Set x-axis limits
    ylim([-3, 6]);    

    drawnow;

end
