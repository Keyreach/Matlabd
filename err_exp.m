clear all;
syms x;

figure();

for t = 3:2:21
	set(gcf, 'name', strcat(num2str(t),' точек')); 

	% равномерно экспонента

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
    x0 = 0:0.005:1;
    f1 = subs(abs(exp(-x)-lagrange(ex,yy)),x,x0);
    plot(x0, f1);
	% ezplot(abs(exp(-x)-lagrange(ex, yy)),[0 1]);
	title(strcat('Максимальная погрешность: ',num2str(max(f1)))); 

	% чебышев экспонента

	a = 0;
	b = 1;
	h = 0:1:t;
	ex = ((b-a)/2).*cos((2.*h+1).*pi./(2.*(t+1)))+(b+a)/2;
	yy = exp(-ex);
	subplot(2,2,3);
	ezplot(lagrange(ex, yy),[0 1]);
	hold on;
	k = ezplot(exp(-x),[0 1]);
	set(k,'Color','r','LineStyle',':');
	hold off;
	% погрешность
	subplot(2,2,4);
    x0 = 0:0.005:1;
    f1 = subs(abs(exp(-x)-lagrange(ex,yy)),x,x0);
    plot(x0, f1);
	%ezplot(abs(exp(-x)-lagrange(ex, yy)),[0 1]);
	title(strcat('Максимальная погрешность: ',num2str(max(f1)))); 
    if t<20
        pause;
    end;

end;