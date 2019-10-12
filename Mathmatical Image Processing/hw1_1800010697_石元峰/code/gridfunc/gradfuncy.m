function [A] = gradfuncy(m, n)
% approximation of nabla_y operator using sparse matrix
    lambda = 2-sqrt(2);
    A = gradfuncy1(m,n).*lambda + gradfuncy2(m,n).*(1-lambda);
end


function [ A ] = gradfuncy1(m, n)
    A = speye(m).*(0.5);
    B = sparse(n, n);
    for i = 1 : n-1
        B(i+1, i) = -1;
        B(i, i+1) = 1;
    end
    A = kron(B, A);
end

function [ A ] = gradfuncy2(m, n)
    A = sparse(m, m);
    B = sparse(n, n);
    for i = 1 : m-1
        A(i, i+1) = 0.25;
        A(i+1, i) = 0.25;
    end
    for i = 1:n-1
        B(i+1, i) = -1;
        B(i, i+1) = 1;
    end
    A = kron(B, A);
end
