function [ ep_SUM, bm_SUM ] = GenerateData( FileName )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
data =csvread([FileName '.csv']);
ep_SUM = Rank_EP( data );
bm_SUM = Rank_BM( data );

end

