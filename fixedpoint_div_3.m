function[x,n] = fixedpoint_div_3(x0, tol)
f = @(x) 1/(sec(pi*x)*x)
f0 = f(x0);
err = f0 - x0;
n=0;
while ((abs(err) > tol) & (n < 10000))
  f0 = x0;
  x0 = f(x0);
  err = x0-f0;
  n = n + 1;
endwhile
x0
n
end