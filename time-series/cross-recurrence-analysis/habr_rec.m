clear; clc;

%Построение рекуррентной диаграммы

% строим временной ряд
[X1,X2,X3,X4]=textread('data.txt','%f %f %f %f');
plot(X2,X4);grid;hold; ; 
ylabel('Wolf');xlabel('Time');

N = length(X1);
M = round(0.3*N);
M1 = N - M; % берём только часть

m = 2; %Размерность пространства вложения
t = 10; %Временная задержка
e = 30; % порог сходимости

%Сюда будем писать восстановленный аттрактор
X(1,1) = 0; 
X(1,2) = 0
j = 1;

%Здесь восстанавливаем траекторию
for i=M1:(N - t)
	X(j,1) = X3(i);
	X(j,2) = X3(i + t);
	j = j + 1;
end
figure;
plot(X(:,1),X(:,2));grid;hold; ; ylabel('Wolf');xlabel('Time');

N1 = length(X(:,1))
D1(1,1) = 0;
D2(1,1) = 0;
%Строим RP - диаграмму
% по формуле: R[i,j,m,e] = O(e[i], — ||x[i] – x[j] ||)
for i = 1:N1
	for j = 1:N1
		D1(i,j)=sqrt((X(i,1)-X(j,1))^2+(X(i,2)-X(j,2))^2);
		if D1(i,j) < e
			D2(i,j) = 0;
		else
			D2(i,j) = 1;
		end;
	end;
end;
figure;
pcolor(D2) ; 
shading interp;
colormap(pink);
figure;
pcolor(D1) ; 
shading interp;
colormap(pink);
hold on