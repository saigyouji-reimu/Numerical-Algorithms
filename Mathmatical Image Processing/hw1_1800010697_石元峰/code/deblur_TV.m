function [u, blured_image, s] = deblur_TV(f, kernel, kernel_rad, lambda_weight)
    addpath('./gridfunc/');
    addpath('./kernel_matrix/');
    %load('process0.mat');                      %已存储好的卷积矩阵
    [m, n] = size(f);
    sigma_1 = 0.01;
    blured_image = imfilter(f, kernel, 'circular') + sigma_1 * randn(m, n);
    % solve total variation model by ADMM
    W = [gradfuncx(m, n); gradfuncy(m, n)];
    process_matrix = kernelMatrix(m, n, kernel_rad, kernel);
    Im1_vector = reshape(blured_image, m*n, 1);
    [u, s] = ADMM(Im1_vector,W,process_matrix,lambda_weight,0.0001,30,reshape(f,m*n,1));
    u = reshape(u, [m, n]);
end

