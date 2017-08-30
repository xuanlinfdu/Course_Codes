LPF5 = 1/25 * ones(5, 5);
HPF5 = -1 * ones(5, 5);
HPF5(3, 3) = +24;
HPF5 = 1/25 * HPF5;

LPF3 = 1/9 * ones(3);
HPF3 = -1 * ones(3);
HPF3(2, 2) = +8;
HPF3 = 1/9 * HPF3;

LPF7 = 1/49 * ones(7);
HPF7 = -1 * ones(7);
HPF7(4, 4) = +48;
HPF7 = 1/49 * HPF7;
% 
% julia1 = im2double(imread('julia1.jpg'));
% [x y z] = size(julia1);
% julia1fil = zeros(x, y, z);
% for i = 1:3
%     julia1fil(:, :, i) = filter2(HPF3, julia1(:, :, i));
% end
% imshow(julia1fil);

taj_flou = im2double(imread('taj_flou.jpg'));
[x y z] = size(taj_flou);
taj_floufil = zeros(x, y, z);
for i = 1:3
    taj_floufil(:, :, i) =  filter2(HPF3, taj_flou(:, :, i));
end
imshow(taj_flou)
figure, imshow(taj_floufil)