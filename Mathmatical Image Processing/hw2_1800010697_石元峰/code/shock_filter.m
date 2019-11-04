function u = shock_filter(image_path, T, result_image_path,...
    noise_size,delta_t, kernel_size, kernel_sigma, method)
% this function implements image restoration using shock filter.
% input_image_path = the path of the input image
% T = the evolution time of the PDE
% output_image_path = the path of the output image
% noise_size = the size of the noise
% delta_t = step size for dicretizing PDE
% [kernel_size, kernel_sigma] = the parameter of the blur kernel.
% method = different choice of the L in shock filter: 1: L(u) = u_xx +
% u_yy; 2: L(u) = u_xx*u_x^2 + u_x*u_y*u_xy + u_yy * u_y^2
if nargin<1
    image_path = 'image/camel.jpg';
end
if nargin<2
    T = 40; 
end
if nargin<3 
    result_image_path = 'image/camel_result.png'; 
end
if nargin<4
    noise_size = 0.01;
end
if nargin<5 
    delta_t = 0.01; 
end
if nargin<6 
    kernel_size = 15;
end
if nargin<7 
    kernel_sigma = 1; 
end
if nargin<8 
    method = 1; 
end
randn('seed', 0);
kernel = fspecial('gaussian',[kernel_size, kernel_size], kernel_sigma);
u0 = rgb2gray(im2double(imread(image_path)));
f = imfilter(u0, kernel, 'circular') + noise_size * randn(size(u0));
u = solve_shock_filter(f, u0, T, delta_t, method);
subplot(1,2,1);
imshow(f);
title(['PSNR = ' num2str(PSNR(f, u0))]);
subplot(1,2,2);
imshow(u);
title(['PSNR = ' num2str(PSNR(u, u0))]);
print(result_image_path, '-dpng');
end