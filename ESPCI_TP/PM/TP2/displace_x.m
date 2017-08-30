function [ Im_d ] = displace_x( Im, d )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(Im);
Im_d = zeros(m, n);
for i = 1:m
    for j = 1:n
        j_d = j - d;
        if j_d < 1
            j_d = j_d + n;
        elseif j_d > n
            j_d = j_d - n;
        end
        Im_d(i, j) = Im(i, j_d);
    end
end


end

