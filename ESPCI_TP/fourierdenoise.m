function [ xt ] = fourierdenoise( x, m )
x = x(:)';
xf = fft(x);
n=length(xf);

% eliminate the high-frequency signal and  reserve the low-frequency signal
% k is the percent of main signal which we want to reserve
a = round(n * m / (100 * 2));
operator = ones(n,1);
operator(a:n-a-1) = 0; 
xd = xf.*operator';   

% reobtain the original signal
xt = ifft(xd); 
xt = real(xt);    
end

