% N = 100;
% n = 50;
% pic = zeros(N);
% pic(((N/2-n/2)+1):(N/2+n/2), ((N/2-n/2)+1):(N/2+n/2)) = ones(n) * 255;

pic = imread('/Users/xuanlin/documents/MATLAB/PM_TP/FICHIERS/scan.jpg');
pic = rgb2gray(pic);
figure, imshow(pic);
pic_rot = picrotate(pic, -85);
figure, imshow(pic_rot,[]);

