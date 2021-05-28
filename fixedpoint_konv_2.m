function[x,n] = fixedpoint_konv_2(x0, tol)
f = @(x) asin(sqrt(1-x^4))/pi
f0 = f(x0);
err = f0 - x0;
n=0;
while (abs(err) > tol)
  f0 = x0;
  x0 = f(x0);
  err = x0-f0;
  n = n + 1;
endwhile
x0
n
end