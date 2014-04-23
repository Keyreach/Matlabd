clear all;
syms x;
a = -5;
b = 5;
f = (x+1)^2+4;
h = (b-a)/4;
eps = 0.00001;
ezplot(f, [-5 5]);
hold on;
x0 = a;
f0 = subs(f,x,x0);
x1 = x0 + h;
f1 = subs(f,x,x1);
while abs(h) > eps
    x1 = x0 + h;
    f1 = subs(f,x,x1);
    if f0 > f1
        x0 = x1;
        f0 = f1;
        while (a<x0) && (x0<b)
            x1 = x0 + h;
            f1 = subs(f,x,x1);
            if f0 > f1
                x0 = x1;
                f0 = f1;
            else
                break;
            end
        end
    end
    x0 = x1;
    f0 = f1;
    h = -h/4;
end
disp(x0);
disp(f0);