function f = lagrange(xx)
for i=1:1:length(xx)
   a = 1;
   b = 1;
   for j=1:1:length(xx)
      if (j~=i)
          a = a * (x-xx(j));
          b = b * (xx(i)-xx(j));
      end
   end
   s = s + yy(i)*a/b;
end
f = simplify(s);
end
function main
a = -1;
b = 1;
t = 2;
h = (a-b)/t;
xx = (-1:h:1);
yy = exp(-xx);
lagrange(xx)
end