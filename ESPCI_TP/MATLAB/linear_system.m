clc
clf
clear all

%% set the basic values
R = 6371;                       % radius of the earth
gps = load('gps.txt'); 
                                % obtain the gps data
c = 2.9979 * 10 ^ 8; 
v = c / R / 10 ^ 6;             % v: R/ms
[m, n] =  size(gps);

%% fabricate the matrix and vectors
cor1 = repmat(gps(2 : m, 1)', n - 1, 1);
correst = gps(2 : m, 2 : n)';
cor = cor1 - correst;
cor(:, 4) =  - 1 * v^2 * cor(:, 4);
cor = 2 * cor;                  % fabricate the matrix
b = (cor1.^2 - correst.^2) * [1 1 1 -v^2]'; 
                                % fabricate the right part of equation
x = cor \ b;                    % position of the fishing-boat


%% print the results
fprintf('La position du chalutier\n');
ax = ['x' 'y' 'z' 't']';
for i = 1:4
    fprintf('%s\t%f\n', ax(i), x(i));
end                             % print the postion of the fishing-boat
fprintf('la norme est %f\n', sqrt(x(1)^2 + x(2)^2 + x(3)^2));

ax = ['n' 'x' 'y' 'z' 't'];
fprintf('Les positions des satellites\n');
for i = 1 : 5
    fprintf('%s\t', ax(i));
    for j = 1 : 6
        if j~= 6
            fprintf('%f\t', gps(i, j));
        else
            fprintf('%f\n', gps(i, j));
        end
    end
end
                                % print the positions of satellites

%% plotting
posi = [[0 ; x] gps];     % fabricate the matrix for ploting
figure(1)
for i = 1 : 7
    if i == 1
        plot3(posi(2, i), posi(3, i), posi(4, i), 'bo');  
        hold on;
grid on;
    else
        plot3(posi(2, i), posi(3, i), posi(4, i), 'k*');
    end
end
                                % plot the points
[xs ys zs] = sphere(30);
plot3(xs, ys, zs);
title('Positions du Chalutier et des Satellites');
xlabel('x'); ylabel('y'); zlabel('z');
axis([-1.5, 3, -1.5, 3, 0, 3]);
legend('chalutier', 'satellite');


