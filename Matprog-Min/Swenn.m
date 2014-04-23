clear all;
syms x;
f = (x+1)^2 + 1;
a = -5;
b = 5;
d = 0.1;
k = 1;
xx(1) = (rand*(b-a))+a;
f1 = subs(f,x,xx(1)-d);
f2 = subs(f,x,xx(1));
f3 = subs(f,x,xx(1)+d);
if (f1>=f2)&&(f2>=f3)
    ch = 1;
    h = d;
    a = xx(1);
    xx(2) = xx(1) + h;
    k = 2;
elseif (f1<=f2)&&(f2<=f3)
    ch = 2;
    h = -d;
    b = xx(1);
    xx(2) = xx(1) - h;
elseif (f1>=f2)&&(f2<=f3)
    ch = 3;
    a = xx(1) - d;
    b = xx(1) + d;
elseif (f1<=f2)&&(f2>=f3)
    ch = 4;
    disp('NOPE');
end
xx(k+1) = xx(k) + h*2^k;
while subs(f,x,xx(k+1)) <= subs(f,x,xx(k))
    if h > 0
        a = xx(k);
        k = k + 1;
    elseif h < 0
        b = xx(k);
        k = k + 1;
    end
    if k > 30
        disp('TOO MANY CYCLES. SOMETHING WENT WRONG.');
    break;
    end
    xx(k+1) = xx(k) + h*2^k;
end
if subs(f,x,xx(k+1)) >= subs(f,x,xx(k))
    if h > 0
        b = xx(k+1);
    elseif h < 0
        a = xx(k+1);
    end
end
disp(a);
disp(b);
ezplot(f, [a b]);
hold on;
xs = [a b];
ys = [subs(f,x,a) subs(f,x,b)]
stem(xs, ys);