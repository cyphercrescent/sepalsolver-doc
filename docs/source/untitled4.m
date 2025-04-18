opts = odeset(Stats='on', NormControl='off');
% tic; [T, Y] = ode45(@predator_prey, [0,50], [40, 9], opts); toc;
% % Define the Predator-Prey model
% function dz = predator_prey(~, z)
%     x = z(1); y = z(2);  % Predator and Prey Population
%     alpha = 1.1;         % Growth rate of prey
%     beta  = 0.2;         % Rate of predation
%     gamma = 0.4;         % Death rate of predators
%     delta = 0.1;         % Growth rate of predators based on prey
%     dz = [alpha * x - beta * x * y; delta * x * y - gamma * y];
% end


% a = 0.25; y0 = 15.9;
% dydt=@(t,y) 2 * (a - t) * y * y;
% tic; [T, Y] = ode78(dydt, [0,1], 15.9, opts); toc;
% plot(T, Y, '-o')

% weissinger = @(t,y,yp) t*y^2 * yp^3 - y^3 * yp^2 + t*(t^2 + 1)*yp - t^2 * y;
% t0 = 1;
% y0 = sqrt(3/2);
% yp0 = 0;
% [y0,yp0] = decic(weissinger,t0,y0,1,yp0,0)
% [t,y] = ode15i(weissinger,[1 10],y0,yp0, opts);
% ytrue = sqrt(t.^2 + 0.5);
% plot(t,y,'*',t,ytrue,'-o')
% legend('ode15i', 'exact')

% options = odeset('Stats', 'on', 'RelTol',1e-4,'AbsTol',[1e-6 1e-10 1e-6]);
% y0 = [1; 0; 1e-3];
% yp0 = [0.5; 0.7; 0];
% %[y0,yp0] = decic(@robertsidae,0,y0,[1 1 0],yp0,[],options);
% tspan = [0, 4e6];
% [t,y] = ode15i(@robertsidae,tspan,y0,yp0,options);
% 
% y(:,2) = 1e4*y(:,2);
% semilogx(t,y)
% ylabel('1e4 * y(:,2)')
% title('Robertson DAE problem with a Conservation Law, solved by ODE15I')
% 
% function res = robertsidae(~, y, yp)
%     res = [yp(1) + 0.04*y(1) - 1e4*y(2)*y(3);
%            yp(2) - 0.04*y(1) + 1e4*y(2)*y(3) + 3e7*y(2)^2;
%            yp(1) + yp(2) + yp(3)];
% end

function dy = vanderPol(t, y, mu)
    dy = [y(2); mu*((1 - y(1) * y(1))*y(2) - y(1))];
end

for i = 0:9
    mu = 10^i;
    [T, Y] = ode15s(@(t, y)vanderPol(t, y, mu), [0, 6.3], [2,0], opts);
    disp(['number of Points in the result = ', num2str(numel(T))])
    disp(['==================', num2str(i), '=================='])
    subplot(1,2,1)
    plot(T, Y)
    axis([0, 6.3, -10, 10])
    subplot(1,2,2)
    sol = load("data.txt"); 
    T = sol(:,1); Y = sol(:, 2:3);
    plot(T, Y)
    axis([0, 6.3, -10, 10])
end