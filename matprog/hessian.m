syms x y z
f = x^2 + y^4;
hessian(f)
f = x+(y^2/4*x)+(z^2/y)+2/z;
hessian(f)
a = gradient(f)
simplify(a)
solve(a)
f = x^4+y^4-(x+y)^2;
hessian(f)
a = gradient(f)
simplify(a)
solve(a)
f = -x+2*x*y-y^2-4*z^2;
hessian(f)