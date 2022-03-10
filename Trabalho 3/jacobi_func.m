function [retval, iter] = jacobi_func (x, A, b, gamma, stop_error, max_iter)
    iter = 0;
    err = stop_error + 1;
    n = size(A, 1);

    while (iter < max_iter && err > stop_error)
        iter++;
        x0 = x;

        for i = 1:n
            x1 = 0;
            for j = 1:n
                if j != i
                    x1 += A(i, j) * x0(j);
                end

                x(i) = (b(i) - x1) / A(i, i);
                x(i) = x(i) * gamma + x0(i) * (1 - gamma);
            end
        end

        err = max(get_residuos(x, A, b));
    end

    retval = x;
endfunction