clear all;
t = 20;
syms x;

figure();

for t = 2:2:20

set(gcf, 'name', strcat(num2str(t),' points'));
    
% равномерно e^-x
ex = linspace(0,1,t);
yy = exp(-ex);
subplot(2,2,1);
ezplot(lagrange(ex, yy),[0 1]);
hold on;
h = ezplot(exp(-x),[0 1]);
set(h,'Color','r','LineStyle',':');
hold off; 
% погрешность
subplot(2,2,2);
ezplot(abs(exp(-x)-lagrange(ex, yy)),[0 1]);
title('Погрешность');

% равномерно рунге
xx = linspace(-1,1,t);
yy = 1./(1+25.*xx.^2);
subplot(2,2,3);
ezplot(lagrange(xx, yy),[-1 1]);
hold on;
j = ezplot(1/(1+25*x^2),[-1 1]);
set(j,'Color','r','LineStyle',':');
hold off; 
% погрешность
subplot(2,2,4);
ezplot(abs(1/(1+25*x^2)-lagrange(xx, yy)),[-1 1]);
title('Погрешность'); 
pause

end

% чебышев e^-x
% a = 0;
% b = 1;
% h = 0:1:t;
% ex = ((b-a)/2).*cos((2.*h+1).*pi./(2.*(t+1)))+(b+a)/2;
% yy = exp(-ex);
% subplot(4,2,5);
% ezplot(lagrange(ex, yy),[0 1]);
% hold on;
% k = ezplot(exp(-x),[0 1]);
% set(k,'Color','r','LineStyle',':');
% % погрешность
% subplot(4,2,6);
% ezplot(abs(exp(-x)-lagrange(ex, yy)),[0 1]);
% title(' ');
% 
% % чебышев рунге
% a = -1;
% b = 1;
% xx = ((b-a)/2).*cos((2.*h+1).*pi./(2.*(t+1)))+(b+a)/2;
% yy = 1./(1+25.*xx.^2);
% subplot(4,2,7);
% ezplot(lagrange(xx, yy),[-1 1]);
% hold on;
% m = ezplot(1/(1+25*x^2),[-1 1]);
% set(m,'Color','r','LineStyle',':');
% % погрешность
% subplot(4,2,8);
% ezplot(abs(1/(1+25*x^2)-lagrange(xx, yy)),[-1 1]);
% title(' ');