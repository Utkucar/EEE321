function fsCoeffs = FSAnalysis(x, k)
    N = length(x); 
    fsCoeffs = zeros(1, 2 * k + 1); 
    for m = -k:k
        for n = 0:N-1
            fsCoeffs(k + m + 1) = fsCoeffs(k + m + 1) + (1/N) * x(n+1) * exp(-1i * m * 2 * pi * n / N);
        end
    end
end
