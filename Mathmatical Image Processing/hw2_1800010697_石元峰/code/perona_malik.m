function u = perona_malik(image_path, T, result_image_path, ...
    noise_size, delta_t, K)
% this function implements image restoration using the PM equation.
% input_image_path = the path of the input image
% T = the evolution time of the PDE
% output_image_path = the path of the output image
% noise_size = the size of the noise
% delta_t = step size for dicretizing PDE
if nargin<1 
    image_path = 'image/barbara.png';
end
if nargin<2
    T = 10; 
end
if nargin<3 
    result_image_path = 'image/barbara_result.png'; 
end
if nargin<4 
    noise_size = 0.05;
end
if nargin<5 
    delta_t = 0.13; 
end
if nargin<6
    K = 0.4;
tic
randn('seed',0);
u0 = rgb2gray(im2double(imread(image_path)));
f = u0 + noise_size * randn(size(u0));
u = solve_perona_malik(f, u0, T, delta_t, K);
subplot(1,2,1);
imshow(f);
title(['PSNR = ' num2str(PSNR(f, u0))]);
subplot(1,2,2);
imshow(u);
title(['PSNR = ' num2str(PSNR(u, u0))]);
print(result_image_path, '-dpng');
toc
end