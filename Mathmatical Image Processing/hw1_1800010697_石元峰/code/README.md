The program implements the ROF model and Tikhnov model .



**All the boundary condition of the convolution is `'circular'`.**

**Requirement**

MATLAB R 2017 a



**Images**

The images are from https://github.com/cszn/DnCNN/tree/master/testsets/Set12



**Codes**

`main()` is the main routine.

PARAMETER: 

```matlab
function u = main(image_path, lambda_weight, kernel_size,...
    kernel_sigma,result_image_path, noise_size, method)
% This is the main function of the image restoration model.
%
% Author: Ting Lin, 1700010644
% Date: 2018/10/14
% image_path = the path of the test image
% lambda_weight = the regularizer parameter
% [kernel_size, kernel_sigma] = the choice of blurring Gaussian kernel
% result_image_path = the path of the restored image
% noise_size = the size of the Gaussian white noise
% method = 'rof', 'tikhnov'
%
```

`solve_rof()` and `solve_tikhnov()`is the subroutine for solving the optimization problem.











barbara(0.01)£º 
1.lambda = 0.001; 2. tol = 0.0001; 3. max_iter = 30;
4.learning_rate = 1; 5. mu = 0.1;
barbara(0.02):
1.lambda = 0.002; 2. tol = 0.0001; 3. max_iter = 30;
4.learning_rate = 0.8; mu = 0.02;
peppers256(0.01):
1.lambda = 0.0025; 2. tol = 0.0001; 3. max_iter = 30;
4.learning_rate = 0.8; mu = 0.08;
peppers256(0.02):
1.lambda = 0.0025; 2. tol = 0.0001; 3. max_iter = 30;
4.learning_rate = 0.8; mu = 0.1;