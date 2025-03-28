% function L = LangFun(y)
%     q1 = y(1); q2 = y(2); v1 = y(3); v2 = y(4);
%     g = 2;
%     L = v1 * v1 + v2 * v2 - q2 * g;
% end
% function dy= dydt_0( t, y)
%     q1 = y(1); q2 = y(2); v1 = y(3); v2 = y(4); 
%     g = 2; z = LangFun(y);
%     dy = [v1; v2; -z * q1; -z * q2 - g];
% end
% 
% [T, Y] = ode45(@dydt_0, [0, 10.1145], [0,1,1,0]);
% Lang = arrayfun(@(i)LangFun(Y(i,:)),1:numel(T));
% plot(T, [Y, Lang'])

M = [1, 0, 0, 0, 0
     0, 1, 0, 0, 0
     0, 0, 1, 0, 0
     0, 0, 0, 1, 0
     0, 0, 0, 0, 0];

% function dy= dydt_1( t, y)
%     q1 = y(1); q2 = y(2); v1 = y(3); v2 = y(4); z = y(5); 
%     g = 2; 
%     dy = [v1; v2; -z * q1; -z * q2 - g; v1 * v1 + v2 * v2 - q2 * g - z];
% end
% 
% opts = odeset(Mass = M);
% [T, Y] = ode15s(@dydt_1, [0, 10.1145], [0,1,1,0,-1], opts);
% plot(T, Y)

function dy= dydt_2( t, y)
    q1 = y(1); q2 = y(2); v1 = y(3); v2 = y(4); z = y(5); 
    g = 2; 
    dy = [v1; v2; -z * q1; -z * q2 - g; q1 * v1 + q2 * v2];
end

opts = odeset(Mass = M);
[T, Y] = ode23t(@dydt_2, [0, 10.1145], [0,1,1,0,-1], opts);
plot(T, Y)
