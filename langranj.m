syms x;
%x0 = -1;
%x1 = 0;
%x2 = 1;
%x3 = 2;
%y0 = -1;
%y1 = 5;
%y2 = 7;
%y3 = 11;
%k0 = (((x-x1)*(x-x2)*(x-x3))/((x0-x1)*(x0-x2)*(x0-x3)))*y0;
%k1 = (((x-x0)*(x-x2)*(x-x3))/((x1-x0)*(x1-x2)*(x1-x3)))*y1;
%k2 = (((x-x0)*(x-x1)*(x-x3))/((x2-x0)*(x2-x1)*(x2-x3)))*y2;
%k3 = (((x-x0)*(x-x1)*(x-x2))/((x3-x0)*(x3-x1)*(x3-x2)))*y3;

syms x;
xx = [-1 0 1 2];
yy = [-1 5 7 11];
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
f = simplify(s)

A1 = zeros(length(xx));
for i=1:1:length(xx)
    for j=1:1:length(xx)
        A1(i,j) = power(xx(i),j-1);
    end
end
disp(A1^-1*yy')

%f = simplify(k0+k1+k2+k3)
ezplot(f);
syms c3;
c0 = yy(1);
c1 = (yy(2)-c0)/(xx(2)-xx(1));
c2 = (yy(3)-c0-c1*(xx(3)-xx(1)))/((xx(3)-xx(1))*(xx(3)-xx(2)));
c3 = 1;
c = [c0 c1 c2 c3];
ff = 0;
for i=1:1:length(c)
   if i > 1
       a = c(i);
       for j=1:1:i-1
           a = a * (x - xx(j));
       end
   else
       a = c(i);
   end
   ff = ff + a;
end
simplify(ff)
%f2 = simplify(c0+c1*(x-x0)+c2*(x-x0)*(x-x1)+c3*(x-x0)*(x-x1)*(x-x2))
%ezplot(f2);