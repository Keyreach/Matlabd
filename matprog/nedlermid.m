clear all;
alpha = 1;
gamma = 2;
beta = 0.5;
delta = 0.5;
h = 10;
cnt = 0;
eps = 0.01;
% x0 = [20 -6]
x0 = [(rand()*30)-15 (rand()*30)-15]
x1 = x0 + [0 h]
x2 = x0 + [h h]
syms x y;
n = 25;
% for i=1:1:n
while (abs(x0(1)-x1(1))>eps)||(abs(x0(2)-x1(2))>eps)
    y0 = myfun(x0);
    y1 = myfun(x1);
    y2 = myfun(x2);
    % Ранжировка
    if y0 > y1
        if y0 > y2
            % y0 > y1 ~ y2
            c = x0;
            if y1 > y2
                b = x1;
                a = x2;
            else
                b = x2;
                a = x1;
            end
        else
            % y2 > y0 > y1
            c = x2;
            b = x0;
            a = x1;
        end
    else
        if y0 < y2
            % y1 ~ y2 > y0
            a = x0;
            if y1 > y2
                c = x1;
                b = x2;
            else
                c = x2;
                b = x1;
            end
        else
            % y1 > y0 > y2
            c = x1;
            b = x0;
            a = x2;
        end
    end
    d = (a + b)/2;
    r = d + alpha*(d - c);
    hold off;
    ezcontour(8*y - 4*x - 4*x*y + 4*x^2 + 4*y^2,[-30 30 -30 30]);
    hold on;
%     plot(a(1),a(2),'or');
%     hold on;
%     plot(b(1),b(2),'oy');
%     hold on;
%     plot(c(1),c(2),'og');
%     hold on;
    plot([a(1) b(1) c(1) a(1)],[a(2) b(2) c(2) a(2)],'o-r');
%     pause;
    if myfun(r)<myfun(a)
        q = d + gamma*(r-d);
        if myfun(q)<myfun(a)
            disp('Растяжение');
            c = q;
        else
            disp('Отражение 1');
            c = r;
        end
    else
        if myfun(r) < myfun(b)
            disp('Отражение 2');
            c = r;
        else
            if myfun(r) < myfun(c)
                disp('Сжатие 1');
                L = d + beta*(r-d);
                c = L;
            else
                L = d + beta*(c-d);
                if myfun(L) < myfun(c)
                    disp('Сжатие 2');
                    c = L;
                else
                    disp('Редукция');
                    c = c + delta*(c-a);
                    b = b + delta*(b-a);
                end
            end
        end
    end
    plot(c(1),c(2),'og');
    hold on;
    x0 = a;
    x1 = b;
    x2 = c;
    cnt = cnt + 1;
%     pause;
end
z = (c+a)/2
plot(z(1),z(2),'ob');
disp('Количество итераций');
disp(cnt);
%     disp(a);
%     disp(b);
%     disp(c);