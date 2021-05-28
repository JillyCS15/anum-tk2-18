function [x,n] = newtonMod(x0,tol)
  f = @(x) x^7 + 6*x^6 + 2*x^5 - 35*x^4 - 19*x^3 + 72*x^2 - 27;
  fdif = @(x) 7*x^6 + 36*x^5 + 10*x^4 - 140*x^3 - 57*x^2 + 144*x;
  n = 0;
  f0 = f(x0);
  multi = 2;
  while abs(f0) > tol
    x0 = x0 - multi*(f(x0)/fdif(x0));
    f0 = f(x0);
    n = n+1;
  endwhile
  x = x0;
  n
endfunction