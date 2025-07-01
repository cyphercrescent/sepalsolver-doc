options = odeset('RelTol',1e-4,'AbsTol',[1e-6 1e-10 1e-6], ...
   'Jacobian',{[],[1 0 0; 0 1 0; 0 0 0]});

y0 = [1; 0; 1e-3];
yp0 = [0; 0; 0];
[y0,yp0] = decic(@robertsidae,0,y0,[1 1 0],yp0,[],options);

tspan = [0 4*logspace(-6,6)];
[t,y] = ode15i(@robertsidae,tspan,y0,yp0,options);

y(:,2) = 1e4*y(:,2);
semilogx(t,y)
ylabel('1e4 * y(:,2)')
title('Robertson DAE problem with a Conservation Law, solved by ODE15I')

function res = robertsidae(t,y,yp)
    res = [yp(1) + 0.04*y(1) - 1e4*y(2)*y(3);
           yp(2) - 0.04*y(1) + 1e4*y(2)*y(3) + 3e7*y(2)^2;
           y(1) + y(2) + y(3) - 1];
end
