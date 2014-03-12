syms x;
x0 = -1;
x1 = 0;
x2 = 1;
x3 = 2;
y0 = -1;
y1 = 5;
y2 = 7;
y3 = 11;
k0 = (((x-x1)*(x-x2)*(x-x3))/((x0-x1)*(x0-x2)*(x0-x3)))*y0;
k1 = (((x-x0)*(x-x2)*(x-x3))/((x1-x0)*(x1-x2)*(x1-x3)))*y1;
k2 = (((x-x0)*(x-x1)*(x-x3))/((x2-x0)*(x2-x1)*(x2-x3)))*y2;
k3 = (((x-x0)*(x-x1)*(x-x2))/((x3-x0)*(x3-x1)*(x3-x2)))*y3;
f = simplify(k0+k1+k2+k3)
ezplot(f);
syms c3;
c0 = y0;
c1 = (y1-c0)/(x1-x0);
c2 = (y2-c0-c1*(x2-x0))/((x2-x0)*(x2-x1));
c3 = 1;
f2 = simplify(c0+c1*(x-x0)+c2*(x-x0)*(x-x1)+c3*(x-x0)*(x-x1)*(x-x2))
ezplot(f2);