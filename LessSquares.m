clc;
clear all;
syms xs;
x = [-1 -0.9 -0.8 -0.7 -0.6 -0.5 -0.4 -0.3 -0.2 -0.1];
y = [-1.5 -1 0 0.5 0.5 1 1 1.5 1 0.5];
n = length(x);
l = x(n) - x(1);
for m = 1:1:3
for i = 1:1:m+1
    for j = 1:1:m+1
        A(i,j) = sum(x.^(i+j-2));
    end
    B(i) = sum(y.*x.^(i-1));
end
P = A^-1*B';
P = P';
S = 0;
for i=1:1:m+1
    S = S + P(i)*(xs^(i-1));
end
% Построение графиков
plot(x,y,'o');
hold on;
ezplot(S,[x(1)-l/2 x(n)+l/2]);
hold off;
f = subs(S,xs,x);
delta = sqrt(sum((f-y).^2)/n)
pause;
end