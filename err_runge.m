clear all;
syms x;

figure();

for t = 3:2:21
	set(gcf, 'name', strcat(num2str(t),' точек'));

	% равномерно рунге

	xx = linspace(-1,1,t);
	yy = 1./(1+25.*xx.^2);
	subplot(2,2,1);
	ezplot(lagrange(xx, yy),[-1 1]);
	hold on;
	j = ezplot(1/(1+25*x^2),[-1 1]);
	set(j,'Color','r','LineStyle',':');
	hold off; 
	% погрешность
	subplot(2,2,2);
    x0 = -1:0.02:1;
    f1 = subs(abs(1/(1+25*x^2)-lagrange(xx,yy)),x,x0);
    plot(x0, f1);
	%ezplot(abs(1/(1+25*x^2)-lagrange(xx, yy)),[-1 1]);
	title(strcat('Максимальная погрешность: ',num2str(max(f1)))); 

	% чебышев рунге

	a = -1;
	b = 1;
    h = 0:1:t;
	xx = ((b-a)/2).*cos((2.*h+1).*pi./(2.*(t+1)))+(b+a)/2;
	yy = 1./(1+25.*xx.^2);
	subplot(2,2,3);
	ezplot(lagrange(xx, yy),[-1 1]);
	hold on;
	m = ezplot(1/(1+25*x^2),[-1 1]);
	set(m,'Color','r','LineStyle',':');
    hold off;
	% погрешность
	subplot(2,2,4);
    x0 = -1:0.02:1;
    f1 = subs(abs(1/(1+25*x^2)-lagrange(xx,yy)),x,x0);
    plot(x0, f1);
	% ezplot(abs(1/(1+25*x^2)-lagrange(xx, yy)),[-1 1]);
	title(strcat('Максимальная погрешность: ',num2str(max(f1)))); 
	if t<20
        pause;
    end;

end;