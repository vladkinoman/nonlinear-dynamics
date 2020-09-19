function f=attractor_var_1(t,X)
%
%  My equation 
%
%               dx/dt = 1000 - 3 * a(1)- 1000 * (a(2)^2) + 10 * (a(3)^2)
%               dy/dt = a(2)+2*a(3)+a(1)*(a(2)+(4/3)*a(3))
%               dz/dt = -2*a(2)+a(3)+a(1)*(-(4/3)*a(2)+a(3))
%
%        Initial conditions: x(0) = 1, y(0) = 1, z(0) = 1;
%        Reference values for t=10 000 : 
%              L_1 = ?, L_2 = ?, LE3 = ?
%
%        See:
%    K. Ramasubramanian, M.S. Sriram, "A comparative study of computation 
%    of Lyapunov spectra with different algorithms", Physica D 139 (2000) 72-86.
%

x=X(1); y=X(2); z=X(3);

Y= [X(4), X(7), X(10);
    X(5), X(8), X(11);
    X(6), X(9), X(12)];

f=zeros(9,1);

%Lorenz equation
f(1)= 1000 - 3 * x - 1000 * (y^2) + 10 * (z^2);
f(2)= y + 2*z + x *(y + (4/3)) * z;
f(3)= -2*y + z + x*(-(4/3)*y + z);

%Linearized system

 Jac=[-3, -2000 * y,     20*z;
      (y + (4/3)) * z,   1 + x,    2 + x * (y + (4/3));
           (-4/3)*y + z,     -2 - (4/3) * x, 1 + x];
  
%Variational equation   
f(4:12)=Jac*Y;

%Output data must be a column vector


