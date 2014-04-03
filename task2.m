syms x;
xx = [100 121 144];
yy = power(xx, 0.5);
xt = 0:1:200;
s = 0;
% Вычисление интерполяционного многочлена методом Лагранжа
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
subplot(2,2,1);
ezplot(f);
axis([0 12 0 12]);
%subplot(2,2,2);
hold on;
plot(power(xt,0.5));
% Вычисление коэффициентов многочлена каноническим методом
A1 = zeros(length(xx));
for i=1:1:length(xx)
    for j=1:1:length(xx)
        A1(i,j) = power(xx(i),j-1);
    end
end
disp(A1^-1*yy')
% Вычисление биномиальных коэффициентов методом разделенных разностей
cc = zeros(length(xx));
for j=1:1:length(xx)
    for i=1:1:length(xx) - j + 1
        if (j==1)
            cc(i,j) = yy(i);
        else
            a = cc(i+1,j-1) - cc(i,j-1);
            b = xx(i+j-1) - xx(i);
            cc(i,j) = a/b;
        end
    end
end
disp(cc);
% Создание вектора биномиальных коэффициентов
for i=1:1:length(cc)
    c(i) = cc(1,i);
end
% Вычисление интерполяционного многочлена методом Ньютона
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
f2 = simplify(ff)
subplot(2,2,3);
ezplot(f2);
axis([0 10 0 10])
hold on
plot(power(xt,0.5));