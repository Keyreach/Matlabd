clear all;
syms x;
a = -5;
b = 5;
f = (x+1)^2+1;
eps = 0.01;
l = 0.01;
xm = (b-a)/2+a;
fm = subs(f,x,xm);
while (b-a) > l
    x1 = xm - eps;
    x2 = xm + eps;
    f1 = subs(f,x,x1);
    f2 = subs(f,x,x2);
    if f1 > f2
        a = xm;
    else
        b = xm;
    end
    xm = (b-a)/2+a;
    fm = subs(f,x,xm);
end
disp(xm);
disp(fm);
ezplot(f, [-5 5]);
hold on;
stem(xm,fm);