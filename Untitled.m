syms x y;
ezcontour(4*x^2-4*x*y+4*y^2-4*x+8*y, [-20 20 -10 10]);
colormap('gray');
grid on;
% set(gca, 'GridLineStyle', ':');
grid(gca,'minor');