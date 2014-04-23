clear all;
syms x;
a = -5;
b = 5;
f = (x+1)^2+1;
eps = 0.001;
xm = (b-a)/2;
fm = subs(f,x,xm);
S = b - a;
while S > eps
    x1 = a + S/4;
    x2 = b - S/4;
    f1 = subs(f,x,x1);
    f2 = subs(f,x,x2);
    if f1 < fm
        b = xm;
        xm = x1;
        fm = subs(f,x,xm);
    else
        a = xm;
        xm = x2;
        fm = subs(f,x,xm);
    end
    S = b - a;
end
disp(xm);
disp(fm);
ezplot(f, [-5 5]);
hold on;
stem(xm,fm);