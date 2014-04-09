clear all;
syms x;
ff = exp(x-2)+(x-2)^2;
fd = diff(ff);
xs = [1 1.5 2 2.5];
ys = subs(ff,x,xs);
yd = subs(fd,x,xs);
n = length(xs);
for i=2:1:n
    h(i) = xs(i) - xs(i-1);
end
for i=2:1:n
    a(i) = ys(i-1);
    b(i) = yd(i-1);
    c(i) = (1/(h(i)^2))*(3*ys(i)-3*ys(i-1)-2*yd(i-1)*h(i)-yd(i)*h(i));
    d(i) = (1/(h(i)^3))*(-2*ys(i)+2*ys(i-1)+yd(i-1)*h(i)+yd(i)*h(i));
end
for i=2:1:n
    S(i-1) = a(i) + b(i)*(x-xs(i-1)) + c(i)*(x-xs(i-1))^2 + d(i)*(x-xs(i-1))^3
end
for i=1:1:n-1
    q = xs(i);
    r = xs(i+1);
    xx = q:0.005:r;
    f1 = subs(S(i),x,xx);
    plot(xx,f1,'Color','k');
    hold on;
end
j = ezplot(ff,[xs(1) xs(n)]);
set(j,'Color','r','LineStyle',':');