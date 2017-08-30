function [ PR_EP ] = Rank_EP( data )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
PR_EP = zeros(1, 5);
[m, n] = size(data);

data_EP = data;

% rank based on EP
EP = data(:, 6);
[sEP, index] = sort(EP);

for i = 1:m
    data_EP(i, :) = data(index(i), :);
end

% count below zero EP
ZeroCount = 0;
for i = 1:m
    if data_EP(i, 6) < 0
        ZeroCount = ZeroCount + 1;
    else
        break;
    end
end

% produce Zero portfolio
if ZeroCount > 0
    P0 = data_EP(1:ZeroCount, :);
    data_EP = data_EP((ZeroCount+1):end, :);
    PR_EP(1) = mean(P0(:, 10));
end

[mp, np] = size(data_EP);
Psize = floor(mp / 4);

P1 = data_EP(1:Psize, :);
P2 = data_EP((Psize+1):(2*Psize), :);
P3 = data_EP((2*Psize+1):(3*Psize), :);
P4 = data_EP((3*Psize+1):end, :);

PR_EP(2) = mean(P1(:, 10));
PR_EP(3) = mean(P2(:, 10));
PR_EP(4) = mean(P3(:, 10));
PR_EP(5) = mean(P4(:, 10));

end

