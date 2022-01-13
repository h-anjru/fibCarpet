function fib = fibonacci(n, a, b)
% FIBONACCI Generates the sequence of Fibonacci numbers up to F(n).
    
    fib = zeros(n+1, 1);
    fib(1:2) = [a; b];

    for ii = 3:n + 1
        c = a + b;
        fib(ii) = c;
        a = b;
        b = c;
    end

end