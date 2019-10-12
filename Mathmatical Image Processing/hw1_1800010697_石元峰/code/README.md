The program implements the ROF model and Tikhnov model .



**All the boundary condition of the convolution is `'circular'`.
**

**Requirement**

MATLAB R 2016 b




**Images**

The images are from https://file-login.cluster-bicmr.com/d/8dc8db5528074187a921/
**Codes**

`main()` is the main routine.


PARAMETER: 

```matlab
function u = main(image_path, lambda_weight, kernel_rad,...
    gaussian_sigma,result_image_path)
% This is the main function of the image restoration model.
%
% Author: Yuanfeng Shi, 1800010697
% Date: 2019/10/12
% image_path = the path of the test image
% lambda_weight = the regularizer parameter
% [kernel_size, kernel_sigma] = the choice of blurring Gaussian kernel
% result_image_path = the path of the restored image
%

Parameter settings

learning_rate, mu, tol and max_iter_time are the parameters in the Split Bregman Method

barbara(0.01): 1. lambda_weight = 0.001; 2. learning_rate = 1; 3. mu = 0.1;

barbara(0.02): 1. lambda_weight = 0.002; 2. learning_rate = 0.8; 3. mu = 0.02;

peppers256(0.01): 1. lambda_weight = 0.0025; 2. learning_rate = 0.8; 3. mu = 0.08;

peppers256(0.02): 1. lambda_weight = 0.0025; 2. learning_rate = 0.8; 3. mu = 0.1;