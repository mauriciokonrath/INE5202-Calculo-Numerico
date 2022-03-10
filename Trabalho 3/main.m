% Reading the data:
n1 = input("");
n2 = input("");

% Generating the system based n1 e n2:
[A, b] = generate_system(n1, n2);

x0 = zeros(1, n2); % Defining the initial solution:
stop_error = 1e-5;
max_iter = 5000;

best_gamma_gauss = 0;  % Dummy number
min_iter_gauss = 1e+6;  % A high number

% This loop will find the best gamma for the Gauss-Seidel's method:Â¨
for gamma = 0.7:0.05:1.4
  [x, iter] = gauss_seidel_func(x0, A, b, gamma, stop_error, max_iter);
  if (iter < min_iter_gauss)
      min_iter_gauss = iter;
      best_gamma_gauss = gamma;
  end  
end

printf("%d\n", min_iter_gauss);
printf("%.2f\n", best_gamma_gauss);

% Using the best gamma for the Jacobi's method
[x, iter] = jacobi_func(x0, A, b, best_gamma_gauss, stop_error, max_iter);
printf("%d\n", iter);