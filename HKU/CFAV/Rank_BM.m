function [ PR_BM ] = Rank_BM( data )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


PR_BM = zeros(1, 5);
[m, n] = size(data);

data_BM = data;

% rank based on BM
BM = data(:, 7);
[sBM, index] = sort(BM);

for i = 1:m
    data_BM(i, :) = data(index(i), :);
end

% count below zero BM
ZeroCount = 0;
for i = 1:m
    if data_BM(i, 7) < 0
        ZeroCount = ZeroCount + 1;
    else
        break;
    end
end

% produce Zero portfolio
if ZeroCount > 0
    P0 = data_BM(1:ZeroCount, :);
    data_BM = data_BM((ZeroCount+1):end, :);
    PR_BM(1) = mean(P0(:, 10));
end

[mp, np] = size(data_BM);
Psize = floor(mp / 4);

P1 = data_BM(1:Psize, :);
P2 = data_BM((Psize+1):(2*Psize), :);
P3 = data_BM((2*Psize+1):(3*Psize), :);
P4 = data_BM((3*Psize+1):end, :);

PR_BM(2) = mean(P1(:, 10));
PR_BM(3) = mean(P2(:, 10));
PR_BM(4) = mean(P3(:, 10));
PR_BM(5) = mean(P4(:, 10));
end

