syms x y;
xx = 1.2295;
yy = -2.9508;
f1 = x^2+(y^2)/4;
f2 = 5*x-3*y-15;
ezcontour(f1);
hold on
ezcontour(f2);
hold on
plot(xx, yy,'o');
subs(subs(f1,x,xx),y,yy)
subs(subs(f2,x,xx),y,yy)