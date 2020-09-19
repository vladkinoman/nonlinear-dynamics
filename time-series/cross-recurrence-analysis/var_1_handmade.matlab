clear; clc; % это очищаем (можно очищать и cls-ом... а clear что делает вместе с ним не знаю :D )

% строим фазовый портрет сложно, но зато получаем множество точек :)
% здесь, a(1) - x, a(2) - y, a(3) - z .. ну хоть тут нумерация не от 0 :D
f = @(t,a) [1000 - 3 * a(1)- 1000 * (a(2)^2) + 10 * (a(3)^2);a(2)+2*a(3)+a(1)*(a(2)+(4/3)*a(3));-2*a(2)+a(3)+a(1)*(-(4/3)*a(2)+a(3))];
%'f' is the set of differential equations and 'a' is an array containing values of x,y, and z variables.
%'t' is the time variable
[t,a] = ode45(f,[0 100],[1 1 1]);%'ode45' uses adaptive Runge-Kutta method of 4th and 5th order to solve differential equations
plot3(a(:,1),a(:,2),a(:,3)) %'plot3' is the command to make 3D plot

% решил для исследования взять вторую переменную и первые 5000 точек
%x = a(1:1000, 2);

%здесь меряем через задержку 10 целых 7000 точек

m = 3
tao = 10
N = 3000 % количество точек всего
v = 2

x(1) = 0;
t = 0;
t(1) = 0;
% восстанавливаем траекторию 
j = 1;
for i=1 : (N - tao)
	t(j) = a(i, v);
	x(j) = a(i+tao, v);
	j = j + 1;
end
figure;
% фазовый портрет
plot(t,x);grid;hold; ; 
xlabel('Time'); ylabel('Wolf');

% строим фазовый портрет
% phasespace(x)

e=pss(x)
%euclidean, minnorm
r = crp(x, m, tao, e, 'minnorm');
%y = recons(r)
% figure;
% pcolor(r) ; 
% shading interp;
% colormap(pink);
% hold on

% N1 = length(x)
% D1(1,1) = 0;
% D2(1,1) = 0;

% %Строим RP - диаграмму
% for i = 1:N1
% 	for j = 1:N1
% 		D1(i,j)=sqrt((x(i)-x(j))^2+(t(i)-t(j))^2);
% 		if D1(i,j) < e
% 			D2(i,j) = 0;
% 		else
% 			D2(i,j) = 1;
% 		end;
% 	end;
% end;
% figure;
% pcolor(D2) ; 
% shading interp;
% colormap(pink);
% figure;
% pcolor(D1) ; 
% shading interp;
% colormap(pink);
% hold on