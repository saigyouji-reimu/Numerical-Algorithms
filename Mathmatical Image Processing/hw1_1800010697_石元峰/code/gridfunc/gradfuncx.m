function [A] = gradfuncx(m, n)
% approximation of nabla_x operator using sparse matrix
    lambda = 2-sqrt(2);
    A = gradfunc1(m,n).*lambda + gradfunc2(m,n).*(1-lambda);
end

function [ A ] = gradfunc1(m, n)
% approximation of nabla_x operator_1
    A = sparse(m, m);
    for i = 1 : m-1
        A(i, i+1) = 0.5;
        A(i+1, i) = -0.5;
    end
    A = kron(speye(n), A);
end

function [ A ] = gradfunc2(m, n)
% approximation of nabla_x operator_2
    A = sparse(m, m);
    B = sparse(n, n);
    for i = 1 : m-1
        A(i, i+1) = 0.25;
        A(i+1, i) = -0.25;
    end
    for i = 1 : n-1
        B(i+1, i) = 1;
        B(i, i+1) = 1; 
    end
    A=kron(B, A);
end
