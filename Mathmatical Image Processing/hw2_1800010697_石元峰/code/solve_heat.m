function u = solve_heat(f, iter_time, delta_t)
    u = f;
    ker = [0,1,0;1,-4,1;0,1,0];
    for t = 1 : iter_time
        u = u + delta_t * imfilter(u, ker, 'circular');
    end
end

