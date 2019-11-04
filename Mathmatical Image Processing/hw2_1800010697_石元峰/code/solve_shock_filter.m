function u = solve_shock_filter(f, u0, iter_time, delta_t, method)
hN = [0 1 0; 0 -1 0; 0 0 0];
hS = [0 0 0; 0 1 0; 0 -1 0];
hE = [0 0 0; 0 -1 1; 0 0 0];
hW = [0 0 0; -1 1 0; 0 0 0];
F = @(x)sign(x);
u = f;
for t = 1:iter_time
    uN = imfilter(u, hN, 'circular');
    uS = imfilter(u, hS, 'circular');
    uW = imfilter(u, hW, 'circular');
    uE = imfilter(u, hE, 'circular');
    nabla = sqrt(minmod(uN,uS).^2 + minmod(uE,uW).^2);
    if method == 1
        L = del2(u);
    end
    if method == 2
        L = BetterChoice(u);
    end
    u = u - delta_t * nabla .* F(L);
    u(u>1) = 1;u(u<0) = 0;
end
end

function x = minmod(a,b)
t = a.*b;
x = min(abs(a),abs(b));
x(t<0) = 0;
end

function v = BetterChoice(u)
gradx = [0 0 0;-0.5 0 0.5;0 0 0];
grady = [0 0.5 0;0 0 0;0 -0.5 0];
gradxx = [0 0 0;1 -2 1;0 0 0];
gradxy = [-0.25 0 0.25;0 0 0;0.25 0 -0.25];
gradyy = [0 1 0;0 -2 0;0 1 0];
ux = imfilter(u, gradx, 'circular');
uy = imfilter(u, grady, 'circular');
uxx = imfilter(u, gradxx, 'circular');
uxy = imfilter(u, gradxy, 'circular');
uyy = imfilter(u, gradyy, 'circular');
v = ux.* ux.* uxx + 2 * ux.* uy.* uxy + uy.* uy.* uyy;
end

