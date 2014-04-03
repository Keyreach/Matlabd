syms x y z;
f = 2*x*z + 2*y*z
ezcontour(f);
grid on;
hold on;
ezcontour(sqrt(x^2+y^2))