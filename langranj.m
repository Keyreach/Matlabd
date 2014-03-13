syms x;
xx = [-1 0 1 2];
yy = [-1 5 7 11];
s = 0;
% ���������� ����������������� ���������� ������� ��������
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
subplot(1,2,1);
ezplot(f);
% ���������� ������������� ���������� ������������ �������
A1 = zeros(length(xx));
for i=1:1:length(xx)
    for j=1:1:length(xx)
        A1(i,j) = power(xx(i),j-1);
    end
end
disp(A1^-1*yy')
% ���������� ������������ ������������� ������� ����������� ���������
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
% �������� ������� ������������ �������������
for i=1:1:length(cc)
    c(i) = cc(1,i);
end
% ���������� ����������������� ���������� ������� �������
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
subplot(1,2,2);
ezplot(f2);