clc
clear
close all

% use lelecum as test object
load leleccum 
x = leleccum(:);

% create a sine signal with noise
fx = 1 : 1: 4500;
fy = 500 * sin(0.004 * fx);
fsin = fy + (50 * rand(1, 4500) - 25);

% create parameter to modulate the denoise
m_valuesvd = [3 10 50 100];
m_valuefourier = [1 2 5 10];

% use SVDdenoise for lelecum with different m
for  i = 1 : 4 
    figure(i);
    plot(x);
    hold on 
    m = m_valuesvd(i);
    xt = svddenoise(x, m);
    plot(xt, 'r');
    title(['SVDdenoise lelecum ', 'm', '=', num2str(m)]);
    legend('original signal', 'signal after denoise');
end















% % use Fourierdenoise for lelecum with different m
% for  i = 1 : 4
%     figure(i + 4);
%     plot(x);
%     hold on 
%     m = m_valuefourier(i);
%     xt = fourierdenoise(x, m);
%     plot(xt, 'r');
%     title(['Fourierdenoise lelecum ', 'm', '=', num2str(m)]);
%     legend('original signal', 'signal after denoise');
% end
% 
% % use SVDdenoise for sine signal with different m
% for i = 1 : 4 
%     figure(i + 8);
%     plot(fsin);
%     hold on 
%     m = m_valuesvd(i);
%     fsint = svddenoise(fsin, m);
%     plot(fsint, 'r');
%     title(['SVDdenoise sine signal ', 'm', '=', num2str(m)]);
%     legend('original signal', 'signal after denoise');
% end

% % use Fourierdenoise for sine signal with different m
% for  i = 1 : 4
%     figure(i + 12);
%     plot(fsin);
%     hold on 
%     m = m_valuefourier(i);
%     fsint = fourierdenoise(fsin, m);
%     plot(fsint, 'r');
%     title(['Fourierdenoise sine signal ', 'm', '=', num2str(m)]);
%     legend('original signal', 'signal after denoise');
% end
