clear all;
syms x;
ff = exp(x-2)+(x-2)^2;
xs = [1 1.5 2 2.5];
ys = exp(xs-2)+(xs-2).^2;
n = length(xs);
for i=1:1:n-1
    h(i+1)=xs(i+1)-xs(i);
end
for i=1:1:n-1
    delta(i+1) = (ys(i+1)-ys(i))/h(i+1);
end
% ЕСТЕСТВЕННЫЙ КУБИЧЕСКИЙ СЛАЙН
for i=1:1:n-2
    A(i, i) = 2*h(i+1)+2*h(i+2);
end
for i=2:1:n-2
    A(i, i-1) = h(i+1);
    A(i-1, i) = h(i+1);
end
disp(A)
for i=2:1:n-1
    B(i-1) = delta(i+1) - delta(i);
end
disp(B')
sigma = (A^-1*B')'
sigma = [0 sigma 0];
for i=1:1:n-1
    w = (x-xs(i))/h(i+1);
    nw = 1 - w;
    kw = w^3;
    knw = nw^3;
    disp(strcat(num2str(i),'---'));
    S(i+1) = ys(i)*nw+ys(i+1)*w+h(i+1)^2*((kw-w)*sigma(i+1)+(knw-nw)*sigma(i));
end
subplot(2,3,1);
for i=1:1:n-1
    a = xs(i);
    b = xs(i+1);
    xx = a:0.005:b;
    f1 = subs(S(i+1),x,xx);
    plot(xx,f1,'Color','k');
    hold on;
end
j = ezplot(ff,[xs(1) xs(n)]);
set(j,'Color','r');
title('Естественный кубический сплайн');
subplot(2,3,4);
for i=1:1:n-1
    a = xs(i);
    b = xs(i+1);
    xx = a:0.005:b;
    f1 = subs(S(i+1),x,xx);
    f2 = subs(ff,x,xx);
    plot(xx,abs(f1-f2),'Color','g');
    hold on;
end
% ПЕРВАЯ ПРОИЗВОДНАЯ
h(n+1)=0;
h(1)=0;
for i=1:1:n
    A(i, i) = 2*h(i)+2*h(i+1);
end
for i=1:1:n-1
    A(i+1, i) = h(i+1);
    A(i, i+1) = h(i+1);
end
disp('---');
disp(A);
delta(1) = subs(diff(ff),x,xs(1));
delta(n+1) = subs(diff(ff),x,xs(n));
for i=1:1:n
    B(i) = delta(i+1) - delta(i);
end
disp(B')
sigma = (A^-1*B')'
% КОНЕЦ ПЕРВОЙ ПРОИЗВОДНОЙ
for i=1:1:n-1
    w = (x-xs(i))/h(i+1);
    nw = 1 - w;
    kw = w^3;
    knw = nw^3;
    disp(strcat(num2str(i),'---'));
    S(i+1) = ys(i)*nw+ys(i+1)*w+h(i+1)^2*((kw-w)*sigma(i+1)+(knw-nw)*sigma(i));
end
subplot(2,3,2);
for i=1:1:n-1
    a = xs(i);
    b = xs(i+1);
    xx = a:0.005:b;
    f1 = subs(S(i+1),x,xx);
    plot(xx,f1,'Color','b');
    hold on;
end
j = ezplot(ff,[xs(1) xs(n)]);
set(j,'Color','r');
title('Первая производная');
subplot(2,3,5);
for i=1:1:n-1
    a = xs(i);
    b = xs(i+1);
    xx = a:0.005:b;
    f1 = subs(S(i+1),x,xx);
    f2 = subs(ff,x,xx);
    plot(xx,abs(f1-f2),'Color','g');
    hold on;
end
% ВТОРАЯ ПРОИЗВОДНАЯ
for i=2:1:n-1
    P(i,i-1) = h(i);
    P(i,i) = 2*h(i)+2*h(i+1);
    P(i,i+1) = h(i+1);
end
P(1,1) = 6;
P(n,n) = 6;
disp(P);
delta(1) = subs(diff(diff(ff)),x,xs(1));
delta(n+1) = subs(diff(diff(ff)),x,xs(n));
for i=1:1:n
    B(i) = delta(i+1) - delta(i);
end
disp(B')
sigma = (P^-1*B')'
for i=1:1:n-1
    w = (x-xs(i))/h(i+1);
    nw = 1 - w;
    kw = w^3;
    knw = nw^3;
    disp(strcat(num2str(i),'---'));
    S(i+1) = ys(i)*nw+ys(i+1)*w+h(i+1)^2*((kw-w)*sigma(i+1)+(knw-nw)*sigma(i));
end
subplot(2,3,3);
for i=1:1:n-1
    a = xs(i);
    b = xs(i+1);
    xx = a:0.005:b;
    f1 = subs(S(i+1),x,xx);
    plot(xx,f1,'Color','k');
    hold on;
end
j = ezplot(ff,[xs(1) xs(n)]);
set(j,'Color','r');
title('Вторая производная');
subplot(2,3,6);
for i=1:1:n-1
    a = xs(i);
    b = xs(i+1);
    xx = a:0.005:b;
    f1 = subs(S(i+1),x,xx);
    f2 = subs(ff,x,xx);
    plot(xx,abs(f1-f2),'Color','g');
    hold on;
end