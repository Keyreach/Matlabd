clear all;
syms x;
f = (x+1)^2+1;
R = svenn(f, -5, 5, 0.1, (rand()*10)-5);
ezplot(f, R);