function [ Im_d ] = displace_y( Im, d )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(Im);
Im_d = zeros(m, n);
for i = 1:m
    for j = 1:n
        i_d = i - d;
        if i_d < 1
            i_d = i_d + m;
        elseif i_d > m
            i_d = i_d - m;
        end
        
        Im_d(i, j) = Im(i_d, j);
    end
end


end

