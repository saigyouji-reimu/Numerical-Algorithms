The program implements the total variational model .



**All the boundary conditions of the convolution are `'circular'`.
**

**Requirement**

MATLAB R 2016 b




**Images**

The images are from https://file-login.cluster-bicmr.com/d/8dc8db5528074187a921
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
% [kernel_rad, gaussian_sigma] = the choice of blurring Gaussian kernel
% result_image_path = the path of the restored image
%

Parameter settings

learning_rate(line 2), mu(line 3), tol(line 1) and max_iter_time(line 1) are the parameters in the Split Bregman Method(ADMM.m)

1. tol = 0.0001; 2. max_iter_time = 30;

barbara(0.01): 1. lambda_weight = 0.001; 2. learning_rate = 1; 3. mu = 0.1;

barbara(0.02): 1. lambda_weight = 0.002; 2. learning_rate = 0.8; 3. mu = 0.02;

peppers256(0.01): 1. lambda_weight = 0.0025; 2. learning_rate = 0.8; 3. mu = 0.08;

peppers256(0.02): 1. lambda_weight = 0.0025; 2. learning_rate = 0.8; 3. mu = 0.1;