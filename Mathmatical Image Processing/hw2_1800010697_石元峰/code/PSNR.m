function [ psnr ] = PSNR(u, f)
% calculate the PSNR value for 2D iamge
[aa, bb] = size(u);
m = max(max(u));
psnr=20*log10((sqrt(aa*bb))*m/(norm(u - f, 'fro')));
end

