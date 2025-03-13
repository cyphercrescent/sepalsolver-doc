xu = [-3, -1, nan, -1, -1, 1, 1, -1, nan, 1, 3];
yu = [0, 0, nan, 0.2*[-1,1,1,-1,-1], nan, 0, 0];
theta = pi*2/3; c = cos(theta); s = sin(theta);
M = [c, s; -s, c]; 
hold on; axis equal;
X = xu - 0; Y = yu - sqrt(3);
for i = 1:3
    plot(X, Y, 'k', LineWidth=2);
    xy = M*[X;Y];  X = xy(1, :); Y = xy(2, :);
end

X = yu; Y = (xu+3)/sqrt(3);
for i = 1:3
    plot(X, Y, 'k', LineWidth=2);
    xy = M*[X;Y];  X = xy(1, :); Y = xy(2, :);
end

L = 'ABCA';
x = 0; y = 2*sqrt(3)+0.2;
for i = 1:3
    text(x, y, "$"+L(i)+"$", Interpreter="latex", HorizontalAlignment="center", FontSize=20);
    xy = M*[x;y];  x = xy(1); y = xy(2);
end

x = 0.4; y = sqrt(3);
for i = 1:3
    text(x, y, "$R_{"+L(i)+"}$", Interpreter="latex", HorizontalAlignment="center", FontSize=15);
    xy = M*[x;y];  x = xy(1); y = xy(2);
end

x = 1.9; y = sqrt(3)/2 + 0.3;
for i = 1:3
    text(x, y, "$R_{"+L(i:i+1)+"}$", Interpreter="latex", HorizontalAlignment="center", FontSize=15);
    xy = M*[x;y];  x = xy(1); y = xy(2);
end

axis([-4,4,-3,4])