function u = CV_model(image_path, lambda, out_maxiter, maxiter, u)
% path = image path
% lambda = the parameter of the regularization term
% out_maxiter = the iteration time of the outer iteration.
% maxiter = the iteration time of the inner iteration.
% u = the initial level set function.
if nargin < 1 
    image_path = 'image/1.jpg'; 
end 
if nargin < 2
    lambda = 1;
end
if nargin < 3
    out_maxiter = 100;
end
if nargin < 4
    maxiter = 20;
end

mu = 0.0004;
f = im2double(rgb2gray(imread(image_path)));

[m,n] = size(f);
kernel = fspecial('gaussian',[15, 15], 2);
%f = f + randn(m,n) * 0.2;
%f = imfilter(f, kernel, 'circular');

soft = @(x) sign(x).*max(abs(x)-1/mu,0);
kernel_D1 = [0,-1,1];
kernel_D2 = [0,-1,1]';
kernel_div1 = kernel_D1(end:-1:1);
kernel_div2 = kernel_D2(end:-1:1);
eigenP = eigenofP(mu,m,n, kernel_D1, kernel_D2);

% Initialize the level set function
if nargin<5
    u=zeros(m,n);%level set function
    for i = 1:m
        for j = 1:n
            u(i,j) = -(min([i j m-i n-j])-10);
        end
    end
end

dx = zeros(m,n);
dy = zeros(m,n);
bx = zeros(m,n);
by = zeros(m,n);
for outiter = 1:out_maxiter
    c1 = sum(sum(f(u<0)))/sum(sum(u<0));
    c2 = sum(sum(f(u>=0)))/sum(sum(u>=0));
    
    r = (f-c1).^2 - (f-c2).^2;
    for iter = 1:maxiter
        % solve u
        y =  mu*imfilter(dx-bx, kernel_div1) +...
            mu*imfilter(dy-by,kernel_div2) - lambda * r;
        u = ifft2(fft2(y)./eigenP);
        u(u<-1) = -1; u(u>1) = 1;
        u1 = imfilter(u,kernel_D1,'circular');
        u2 = imfilter(u,kernel_D2,'circular');
        % solve d
        dx = soft(u1+bx);
        dy = soft(u2+by);
        % solve b
        bx = bx +1.6*(u1 - dx);
        by = by +1.6*(u2 - dy);
        
        if (norm(u1,'fro')+norm(u2,'fro'))/norm(f,'fro') < 1e-4; break; end
    end
end
c_img = show_contour(u, f); imshow(c_img,[]);
end


function eigenP=eigenofP(mu,m,n,kernel_D1,kernel_D2)
kernel = [1];
[nker,mker]=size(kernel);
tmp=zeros(m,n);tmp(1:nker,1:mker)=kernel;
tmp=circshift(tmp,[-floor(nker/2),-floor(mker/2)]);
eigenP=0.0001 * abs(fft2(tmp)).^2;

[nker,mker]=size(kernel_D1);
tmp=zeros(m,n);tmp(1:nker,1:mker)=kernel_D1;
tmp=circshift(tmp,[-floor(nker/2),-floor(mker/2)]);
eigenP= eigenP +mu * abs(fft2(tmp)).^2;

[nker,mker]=size(kernel_D2);
tmp=zeros(m,n);tmp(1:nker,1:mker)=kernel_D2;
tmp=circshift(tmp,[-floor(nker/2),-floor(mker/2)]);
eigenP=eigenP + mu * abs(fft2(tmp)).^2;
end


