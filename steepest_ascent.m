function x = steepest_ascent(x0, TOL, MAX_ITER)
  % x: initial guess value as a vector of n elements
  % TOL: error tolerance
  % MAX_ITER: max number of iteration
  % Return: solution of Non-linear System of Equations
  
  g = @(w,x,y,z) (w+1)*(x+1)+(x+1)*(y+1)+(y+1)*(z+1)-w^2-x^2-y^2-z^2;
  
  x = x0';
  iter = 0;
  
  while (norm(g(x(1),x(2),x(3),x(4))) > TOL && iter < MAX_ITER)
    % masukkan tebakan awal ke fungsi F(u,v,w) dan J(u,v,w)
    g_val = nabla_g(x(1),x(2),x(3),x(4));
    p0 = -g_val;
    
    alpha = newton_opt_g([1,1,1,1],1e-2,100);
    
    % Iterasi: x1 = x0 + alpha*p0
    printf("Iteration %d results:\n", iter);
    x = x + alpha' * p0
    iter = iter + 1;
  endwhile
  
endfunction