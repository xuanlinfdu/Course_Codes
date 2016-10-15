function [xt] = svddenoise(x, m)


x = x(:);
N = length(x);
 
%% fabricate the Hankel Matrix
matrixhankel = zeros(m, N-m+1);        
for i = 1:m
    matrixhankel(i, :) = x(i:N-m+i);
end
 
%% obtain the mean value and singular value decomposition 
meanvalue = mean(matrixhankel, 2);      % obtain the mean value
matrixvari = matrixhankel - repmat(meanvalue, 1, size(matrixhankel, 2));
[U, S, V] = svd(matrixvari);            % svd denoise
variances = diag(S(1:m, 1:m)); 

%% eliminate the noise
variancesde = variances;                   
% obtain the variance of the original signal
variancesmean = mean(variancesde);
variancesde(variancesde < variancesmean) = 0;
% the variances less than the mean value are turned to zero

%% reconstruct the signal
Sde = S; Sde(1:m,1:m)=diag(variancesde);
sigde = U*Sde*V' + repmat(meanvalue, 1, size(matrixhankel, 2)); 
 
xt = sigde(1, :);
xt = xt(:);

end

