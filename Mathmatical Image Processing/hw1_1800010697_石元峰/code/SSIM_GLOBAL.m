function [ m ] = SSIM_GLOBAL(u, f)
% calculate the PSNR value for 2D iamge
[aa, bb] = size(u);
m = 0;
for i = 1 : aa - 14
    for j = 1 : bb - 14
        m = m + ssim(u(i : i + 14, j : j + 14), f(i : i + 14, j : j + 14));
    end
end
m = m / ((aa - 14) * (bb - 14));
end