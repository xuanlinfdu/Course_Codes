L = 33;
Im1 = zeros(L);

% generate image
rng(2);
position = ceil(rand(2, 20) * L);
num = 0;
i = 1;
while(num < 10)
    if Im1(position(1, i), position(2, i)) == 0
        Im1(position(1, i), position(2, i)) = 1;
        num = num + 1;
        i = i + 1;
    else
        i = i +1;
    end
end
figure
imagesc(Im1);
title('Im1: original image');

% displaced by 3 pixels

Im2 = displace_x(Im1, 3);
figure
imagesc(Im2);
title('Im2: image displaced by 3 pixels');


% identical displacement
ImAC = zeros(L);
L = size(ImAC, 1);
for x = 1:L
    for y = 1:L
        ImAC(x, y) = acfunction(Im1, Im1, x-ceil(L/2), y-ceil(L/2));
    end
end
figure
imagesc(ImAC);
title('Im1 & Im1 by AC');

% displacement by 3 pixels by acfunction
tic;
ImAC = zeros(L);
for x = 1:L
    for y = 1:L
        ImAC(x, y) = acfunction(Im1, Im2, x-ceil(L/2), y-ceil(L/2));
    end
end
toc

figure
imagesc(ImAC);
title('Im1 & Im2 by AC');

% idential displacement by FFT
ImACf = correlationfft(Im1, Im1);
figure
imagesc(ImACf);
title('Im1 & Im1 by FFT');

% displacement by 3 pixels by FFT
tic;
ImACf = correlationfft(Im1, Im2);
toc

figure
imagesc(ImACf);
title('Im1 & Im2 by FFT');


factor_noise = 1;
rng(100);
Im_noise = Im2 + (rand(L)*factor_noise);
figure
imagesc(Im_noise);
title('Im\_noise: image displaced with noise');


Imf = correlationfft(Im1, Im_noise);
figure
imagesc(Imf);
title('Im1 & Im\_noise by FFT, noise factor = 1');

factor_noise = 3;
rng(100);
Im_noise = Im2 + (rand(L)*factor_noise);

Imf = correlationfft(Im1, Im_noise);
figure
imagesc(Imf);
title('Im1 & Im\_noise by FFT, noise factor = 3');

factor_noise = 4;
rng(100);
Im_noise = Im2 + (rand(L)*factor_noise);

Imf = correlationfft(Im1, Im_noise);
figure
imagesc(Imf);
title('Im1 & Im\_noise by FFT, noise factor = 4');


        
        