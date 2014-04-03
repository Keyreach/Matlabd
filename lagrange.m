function f = lagrange(xx, yy)
syms x;
s = 0;
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
f = s;