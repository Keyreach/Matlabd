clear all;
syms x;
f = (x+1)^2+1;
eps = 0.01;
a = -5;
b = 5;
n = 10;
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
while n > 3
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
end
disp(x1);
disp(x2);
