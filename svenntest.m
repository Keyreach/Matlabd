clear all;
syms x;
f = (x+1)^2+1;
R = svenn(f, -5, 5, 0.1, (rand()*20)-10);
stem(R(1),subs(f,x,R(1)));
hold on;
stem(R(2),subs(f,x,R(2)));
hold on;
ezplot(f, [-10 10]);