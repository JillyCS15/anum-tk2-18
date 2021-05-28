function x = newton_mod_NSE(x0, TOL, MAX_ITER)
  % x: initial guess value as a vector of n elements
  % TOL: error tolerance
  % MAX_ITER: max number of iteration
  % Return: solution of Non-linear System of Equations
  
  x = x0';
  iter = 0;
  is_convergent = false;
  
  while (norm(spnl_func(x)) > TOL && iter < MAX_ITER)
    % masukkan tebakan awal ke fungsi F(u,v,w) dan J(u,v,w)
    f_val = spnl_func(x);
    j_val = jacobi_func(x);
    
    for i = 1:2
      % selesaikan spl J(u,v,w)d = -F(u,v,w) menggunakan LU factorization
      [L, U] = funLU(j_val);
      y = lower(L, -1*f_val);
      d = upper(U, y);
      
      printf("Iteration %d results:\n", iter);
      x = x + d
      
      % jika sudah dicapai konvergensi maka stop perhitungan
      if (norm(spnl_func(x)) < TOL)
        is_convergent = true;
        break
      endif
    endfor
    
    if (is_convergent == true)
      break
    endif
    
    % printf("Iteration %d results:\n", iter);
    x = x + d;
    iter = iter + 1;
  endwhile
  
endfunction