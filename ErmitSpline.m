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
    a0(i) = ys(i-1);
    a1(i) = yd(i-1);
    a2(i) = (1/(h(i)^2))*(3*ys(i)-3*ys(i-1)-2*yd(i-1)*h(i)-yd(i)*h(i));
    a3(i) = (1/(h(i)^3))*(-2*ys(i)+2*ys(i-1)+yd(i-1)*h(i)+yd(i)*h(i));
end
for i=2:1:n
    S(i-1) = a0(i) + a1(i)*(x-xs(i-1)) + a2(i)*(x-xs(i-1))^2 + a3(i)*(x-xs(i-1))^3
end
for i=1:1:n-1
    a = xs(i);
    b = xs(i+1);
    xx = a:0.005:b;
    f1 = subs(S(i),x,xx);
    plot(xx,f1);
    hold on;
end
j = ezplot(ff,[xs(1) xs(n)]);
set(j,'Color','r');