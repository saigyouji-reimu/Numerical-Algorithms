function [ u, m, u0 ] = ADMM( f,W,A,lambda,tol,max_iter_time,original )
learning_rate = 0.8;
mu = 0.1; 
u  = f;
d  = zeros(size(W * u));
b  = zeros(size(d));
m  = 0;
process = A' * A + mu * W' * W;

for i = 1 : max_iter_time
    tmp = A'*f + W'*(d-b).*mu;
    u   = gmres(process, tmp);
    if PSNR(u, original) > m
        m = PSNR(u, original);
    end
    d   = W*u+b;
    d   = sign(d).*max(abs(d)-lambda/mu,0);
    b   = b+(W*u-d).*learning_rate;
    if norm(W*u-d) < tol*norm(f)
        fprintf('Completed\n');
        break;
    end
end
end
