function [ ImACf ] = correlationfft( Im1, Im2 )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
ImACf = conj(fft2(Im1)) .* fft2(Im2);
ImACf = abs(fftshift(ifft2(ImACf)));

end

