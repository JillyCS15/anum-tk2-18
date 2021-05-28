function x = steepest_descent(x0, TOL, MAX_ITER)
  % x: initial guess value as a vector of n elements
  % TOL: error tolerance
  % MAX_ITER: max number of iteration
  % Return: solution of Non-linear System of Equations
  
  f = @(x,y) x^2 - x*y + y^2 + e^(x*y);
  
  x = x0';
  iter = 0;
  
  while (norm(f(x(1), x(2))) > TOL && iter < MAX_ITER)
    % masukkan tebakan awal ke fungsi F(u,v,w) dan J(u,v,w)
    f_val = nabla_f(x(1),x(2));
    p0 = -f_val;
    
    alpha = newton_opt_f([1,1],1e-2,100);
    
    % Iterasi: x1 = x0 + alpha*p0
    printf("Iteration %d results:\n", iter);
    x = x - alpha' * p0
    iter = iter + 1;
  endwhile
  
endfunction