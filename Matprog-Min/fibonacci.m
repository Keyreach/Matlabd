clear all;
syms x;
cnt = 0;
f = (x+1)^2+1;
eps = 0.01;
a = -5;
b = 5;
n = (b-a)/eps;
fib(1) = 1;
fib(2) = 1;
for i = 3:1:n;
    fib(i) = fib(i-1) + fib(i-2);
end
l = b - a;
x1 = a+l*(fib(n-2)/fib(n));
x2 = a+l*(fib(n-1)/fib(n));
f1 = subs(f,x,x1);
f2 = subs(f,x,x2);
ezplot(f,[-5 5]);
hold on
while n > 3
stem(x1, f1);
hold on;
stem(x2, f2);
hold on;
n = n - 1;
if f1 > f2
    a = x1;
    x1 = x2;
    x2 = b - (x1 - a);
    f1 = f2;
    f2 = subs(f,x,x2);
else
    b = x2;
    x2 = x1;
    x1 = a + (b - x2);
    f2 = f1;
    f1 = subs(f,x,x1);
end
cnt = cnt + 1;
end
s = (x1+x2)/2
stem(s, subs(f,x,s));
disp('Число циклов');
disp(cnt);
