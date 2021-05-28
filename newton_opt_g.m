function x = newton_opt_g(x0, TOL, MAX_ITER)
  % x: initial guess value as a vector of n elements
  % TOL: error tolerance
  % MAX_ITER: max number of iteration
  % Return: solution of Non-linear System of Equations
  
  x = x0';
  iter = 0;
  
  while (norm(nabla_g(x(1), x(2),x(3),x(4))) > TOL && iter < MAX_ITER)
    % masukkan tebakan awal ke fungsi F(u,v,w) dan J(u,v,w)
    g_val = nabla_g(x(1), x(2),x(3),x(4));
    h_val = hessian_g(x(1), x(2),x(3),x(4));
    
    % selesaikan spl J(u,v,w)d = -F(u,v,w)
    v = h_val\-g_val;
    
    % printf("Iteration %d results:\n", iter);
    x = x - v;
    iter = iter + 1;
  endwhile
  
endfunction