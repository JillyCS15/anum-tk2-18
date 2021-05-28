function g = nabla_g(w,x,y,z)
  g(1) = -2*w + x + 1;
  g(2) = -2*x + y + w + 2;
  g(3) = -2*y + z + x + 2;
  g(4) = -2*z + y + 1;
  g=g';
endfunction