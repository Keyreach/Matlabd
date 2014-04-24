clear all;
syms x;
cnt = 0;
a = -5;
b = 5;
f = (x+1)^2+1;
eps = 0.01;
xm = (b-a)/2;
fm = subs(f,x,xm);
S = b - a;
ezplot(f, [-5 5]);
hold on;
while S > eps
    x1 = a + S/4;
    x2 = b - S/4;
    f1 = subs(f,x,x1);
    f2 = subs(f,x,x2);
    stem(x1, f1);
    hold on;
    stem(x2, f2);
    hold on;
    pause;
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
    cnt = cnt + 1;
end
disp(xm);
% disp(fm);
stem(xm,fm);
disp('Число циклов');
disp(cnt);