test_im = [zeros(2, 5); ones(1, 5); zeros(2, 5)];
imagesc(test_im);
fft_im = fft(test_im, [], 1);
figure;
imagesc(fft_im);

