t = 5;
a = -1;
b = 1;
h = -1:1:t;
xx = ((b-a)/2).*cos((2.*h+1).*pi./(2.*(t+1)))+(b+a)/2
yy = 1./(1+25.*xx.^2)
ezplot(lagrange(xx, yy));