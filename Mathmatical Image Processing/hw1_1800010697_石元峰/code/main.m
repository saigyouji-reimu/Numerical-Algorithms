% File Name : main.m
function u = main(image_path, lambda_weight, kernel_rad, ...
    gaussian_sigma, result_image_path)
if nargin <1 
    image_path='image/peppers256.png'; 
end 
if nargin <2 
    lambda_weight = 0.002; 
end                           % lambda
if nargin <3 
    kernel_rad = 7; 
end                           % ����˰뾶
if nargin <4 
    gaussian_sigma = 1; 
end                           % ��˹�˷���
if nargin <5 
    result_image_path = 'image/peppers256_result.png'; 
end                           % ���ͼƬ��
kernel_size = 2 * kernel_rad + 1;
kernel = fspecial('gaussian',[kernel_size, kernel_size], gaussian_sigma);
f  =  rgb2gray(im2double(imread(image_path))); % ��ȡͼƬ   
[u, blured_image, s]  =  deblur_TV(f, kernel, kernel_rad, lambda_weight); % deblur by total variation
disp(PSNR(u,f)); disp(s);
disp(PSNR(blured_image,f));
subplot(1,3,1); imshow((f)); xlabel('Oringinal');
subplot(1,3,2); imshow((blured_image)); xlabel('Blurred');
title(['PSNR = ' num2str(PSNR(blured_image,f))]); 
subplot(1,3,3); imshow((u)); xlabel('Restored');
title(['PSNR = ' num2str(PSNR(u,f))]);
print(result_image_path, '-dpng'); % �� �� �� �� �� �� �� ��
end

