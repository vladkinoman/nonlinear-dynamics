% строим фазовый портрет сложно, но зато получаем множество точек :)
% здесь, a(1) - x, a(2) - y, a(3) - z .. ну хоть тут нумерация не от 0 :D
f = @(t,a) [-10*(a(1) - a(2));
(-1) * a(1) * a(3) + 24.74 * a(1) - a(2);
a(1)*a(2) - (8/3)*a(3)];

%'f' is the set of differential equations and 'a' is an array containing values of x,y, and z variables.
%'t' is the time variable
[t,a] = ode45(f,[0 100],[0 1 1]);%'ode45' uses adaptive Runge-Kutta method of 4th and 5th order to solve differential equations
plot3(a(:,1),a(:,2),a(:,3))

%........ Данные..............
% какую переменную будем рассматривать (1 - х, 2 - у..)
v = 2
% размерность пространства вложения
m = 3
% время задержки
tao = 20
% количество точек всего
N = 2000
% откуда начинаем мерять
M1 = 100
% радиус сферы
e = 1
% чем больше порог - тем больше траекторий
%.............................
% в эту матрицу будем записывать восстановленный аттрактор
x(1, 1) = 0;
x(1, 2) = 0;

% восстанавливаем траекторию 
j = 1;
for i=M1 : (N - tao)
	%x(j,1) = a(i, v);
	x(j,2) = a(i+tao, v);
	j = j + 1;
end
% % фазовый портрет
% plot(x(:,1),x(:,2));grid;hold; ; 
phasespace(x(:,2))
%plot(M1:(N-tao),x(:,2))
% стоит ли определить так?
%e=pss(x)

%нормы - euclidean, minnorm

% r = crp(x(:,2), m, tao, e); % здесь получаем матрицу порядка. r потом можно использовать
crp(x(:,2), m, tao, e) % строим интерактивно recurrent plot
