clear all;
syms x;
cnt = 0;
f = (x+1)^2+1;
eps = 0.01;
a = -5;
b = 5;
t = 0.61803;
l = b - a;
x2 = l*t+a;
x1 = l - x2;
ezplot(f,[-5 5]);
hold on;
while l>eps
    l = b - a;
    x1 = b - l*t;
    x2 = a + l*t;
    f1 = subs(f,x,x1);
    f2 = subs(f,x,x2);
    stem(x1, f1);
    hold on;
    stem(x2, f2);
    hold on;
    pause;
    if f1 > f2
        a = x1;
    else
        b = x2;
    end
    cnt = cnt + 1;
end
s = (a+b)/2
ezplot(f);
hold on;
stem(s, subs(f,x,s));
disp('Число циклов');
disp(cnt);