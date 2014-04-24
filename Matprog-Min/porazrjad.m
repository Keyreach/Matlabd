clear all;
syms x;
cnt = 0;
j = 1;
a = -5;
b = 5;
f = (x+1)^2+1;
h = (b-a)/4;
eps = 0.01;
x0 = a;
f0 = subs(f,x,x0);
ezplot(f, [-5 5]);
hold on;
while abs(h) > eps
    while j==1
        x1 = x0 + h;
        f1 = subs(f,x,x1);
        if f0 > f1
            x0 = x1;
            f0 = f1;
            stem(x0, f0);
            hold on;
            pause;
            if ~((a<x0) && (x0<b))
                break;
            end
        else
            break;
        end
        cnt = cnt + 1;
    end
    x0 = x1;
    f0 = f1;
    h = -h/4;
end
disp(x0);
% disp(f0);
stem(x0,f0);
disp('Число циклов');
disp(cnt);