function[x,n] = fixedpoint_div_1(x0,tol)
f = @(x) sqrt(cos(pi*x))
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