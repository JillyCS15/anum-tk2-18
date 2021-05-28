function x = newton_lagrange(x0, TOL, MAX_ITER)  
  % x: initial guess value as a vector of n elements
  % TOL: error tolerance
  % MAX_ITER: max number of iteration
  % Return: solution of Non-linear System of Equations
  
  mbf = @(x,y) [sin(y)*e^((1-cos(x))^2)+cos(x)*e^((1-cos(x))^2)+(x-y)^2];
  nabla_mbf = @(x,y) [2.*sin(y).*exp((1-cos(x)).^2).*(1-cos(x)).*sin(x)-exp((1-sin(y)).^2).*sin(x)+2.*(x-y); -2.*cos(x).*exp((1-sin(y)).^2).*cos(y).*(1-sin(y))+exp((1-cos(x)).^2).*cos(y)-2.*(x-y)];
  hessian_mbf = @(x,y) [4.*sin(y).*exp((1-cos(x)).^2)*(1-cos(x)).^2.*sin(x).^2+2.*sin(y).*exp((1-cos(x)).^2).*sin(x).^2+2.*sin(y).*exp((1-cos(x)).^2).*(1-cos(x)).*cos(x)-exp((1-sin(y)).^2).*cos(x)+2,2.*sin(x).*exp((1-sin(y)).^2).*cos(y).*(1-sin(y))+2.*exp((1-cos(x)).^2).*(1-cos(x)).*sin(x).*cos(y)-2;2.*cos(y).*exp((1-cos(x)).^2).*(1-cos(x)).*sin(x)+2.*exp((1-sin(y)).^2).*cos(y).*(1-sin(y)).*sin(x)-2,2.*cos(x).*exp((1-sin(y)).^2).*(1-sin(y)).*sin(y)-exp((1-cos(x)).^2).*sin(y)+4.*cos(x).*exp((1-sin(y)).^2).*cos(y).^2.*(1-sin(y)).^2+2.*cos(x).*exp((1-sin(y)).^2).*cos(y).^2+2];
  
  x = x0';
  iter = 0;
  
  while (norm(nabla_mbf(x(1), x(2))) > TOL && iter < MAX_ITER)
    % masukkan tebakan awal ke fungsi grad f dan hessian
    f_val = nabla_mbf(x(1),x(2));
    h_val = hessian_mbf(x(1),x(2));
    
    % selesaikan spl grad*v = hessian
    v = h_val\-f_val;
    
    x = x + v;
    iter = iter + 1;
  endwhile
  
  printf("Jumlah fungsi yang dipanggil: %d\n", iter);
  printf("Nilai x: %d\n", x(1));
  printf("Nilai y: %d\n", x(2));
  printf("Nilai fungsi pada x dan y: %d\n", mbf(x(1),x(2)));
  
  
endfunction