Im3 = zeros(720, 800);
n_point = 50000;

% generate images with random points
position = zeros(2, 10000000);
rng(2);
position(1, :) = ceil(rand(1, 10000000) * 720);
rng(10);
position(2, :) = ceil(rand(1, 10000000) * 800);
num = 0;
i = 1;
while(num < n_point)
    if Im3(position(1, i), position(2, i)) == 0
        Im3(position(1, i), position(2, i)) = 1;
        num = num + 1;
        i = i + 1;
    else
        i = i +1;
    end
end
figure;
imagesc(Im3);
title('Im3: original image');

% create image displaced
Im4 = displace_x(Im3, 3);
Im4 = displace_y(Im4, 3);
figure
imagesc(Im4);
title('Im4: displaced image');

% create image rotated
Im5 = imrotate(Im3, 2);
[r5, c5] = size(Im5);
Im6 = Im5(ceil((r5-720)/2):ceil((r5-720)/2)+720-1, ceil((c5-800)/2):ceil((c5-800)/2)+800-1);
figure
imagesc(Im6);
title('Im6: rotated image by 3 degrees');

% cross-correltion displacement
L = 8;
[x, y, u, v] = displacementfield(Im3, Im4, L);
figure
quiver(x, y, u, v);
title('displacement field: Im3 & Im4, L = 8');

L = 16;
[x, y, u, v] = displacementfield(Im3, Im4, L);
figure
quiver(x, y, u, v);
title('displacement field: Im3 & Im4, L = 16');

L = 40;
[x, y, u, v] = displacementfield(Im3, Im4, L);
figure
quiver(x, y, u, v);
title('displacement field: Im3 & Im4, L = 40');


% cross-correlation rotation
L = 40;
[xr, yr, ur, vr] = displacementfield(Im3, Im6, L);
figure
quiver(xr, yr, ur, vr);
title('displacement field: Im3 & Im6: L = 40');




