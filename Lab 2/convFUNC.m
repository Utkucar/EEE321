function [y] = convFUNC(x, h)
    Nx = length(x);
    Nh = length(h);
    Ny = Nx + Nh - 1; % Length of the output sequence
    
    % Pad the input signals with zeros to handle edge cases
    x_padded = [zeros(1, Nh-1), x, zeros(1, Nh-1)];
    h_padded = fliplr(h); % Flip h to perform convolution
    
    % Perform convolution using vectorized operations
    y = zeros(1, Ny);
    for n = 1:Ny
        % Compute the convolution sum for position n using vectorized operations
        y(n) = sum(x_padded(n : n+Nh-1) .* h_padded);
    end
end

