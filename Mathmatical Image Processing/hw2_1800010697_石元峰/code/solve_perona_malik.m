function u = solve_perona_malik(f,u0,iter_time,delta_t,K)
u = f;
% differential operator in four directions.
hN = [0 1 0; 0 -1 0; 0 0 0];
hS = [0 0 0; 0 -1 0; 0 1 0];
hE = [0 0 0; 0 -1 1; 0 0 0];
hW = [0 0 0; 1 -1 0; 0 0 0];
for t = 1 : iter_time
    dN = imfilter(u, hN, 'conv');
    dS = imfilter(u, hS, 'conv');
    dW = imfilter(u, hW, 'conv');
    dE = imfilter(u, hE, 'conv');
    cN = 1./(1 + (dN/K).^2);
    cS = 1./(1 + (dS/K).^2);
    cW = 1./(1 + (dW/K).^2);
    cE = 1./(1 + (dE/K).^2);
    % evolve 
    u = f + delta_t * (cN.*dN + cS.*dS + cW.*dW + cE.*dE);
    u(u>1) = 1; u(u<0) = 0;
end
end