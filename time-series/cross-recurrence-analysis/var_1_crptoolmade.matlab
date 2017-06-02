% build source attractor
f = @(t,a) [1000 - 3 * a(1)- 1000 * (a(2)^2) + 10 * (a(3)^2);
a(2)+2*a(3)+a(1)*(a(2)+(4/3)*a(3));
-2*a(2)+a(3)+a(1)*(-(4/3)*a(2)+a(3))];

[t,a] = ode45(f,[0 100],[1 1 1]);
plot3(a(:,1),a(:,2),a(:,3))

% what variable shall we consider? 1 - х, 2 - у, 3 - z
v = 2
% it's a lag. My advice - leave tao=1 and change it interactively with GUI
tao = 1
% max count of dots
N = 3500
% from where we begin to measure
M1 = 400

% we're going to write time series into vector x
x(1) = 0;
j = 1;
for i=M1 :(N - tao)
	x(j) = a(i+tao, v);
	j = j + 1;
end
% build phase space to know what lag we need
phasespace(x)
tao = 50

m = 10
% http://www.mpipks-dresden.mpg.de/~tisean/TISEAN_2.1/docs/chaospaper/node9.html
fnn(x, m, tao)
% optimal embeding dimension we got in fnn plot
m = 3

% neighbourhood, radius of sphere:
e = 2.5
r = crp(x, m, tao, e)

% reconstruct attractor with RP matrix
y = recons(r)
% build phasespace of reconstructed attractor
phasespace(y)

% 	two methods that you can use to get reconstructed attractor
%		r = crp(x, m, tao, e)
%		y = recons(r)
% 	or with next method:
%		r = crp(x, m, tao, e)
%		y = recons(r, 'hirata')