function KQ = FuncTichPhan(x, y, fx, N, a, b, pp)
    if(length(x) ~= length(y))
        fprintf('x và y BẮT BUỘC phải cùng độ dài');
    end

    fx = matlabFunction(str2sym(fx));

    switch(pp)
        case 'Hình thang'
            h = (b - a) / N;
            KQ = (h/2)*(fx(a)+fx(b)+2*sum(fx(a+h:h:b-h)));

        case 'Simpson 1/3'
            if mod(N, 2) ~= 0
                N = N + 1;
            end
            h = (b - a) / N;
            x = a + (0:N) * h;
            fx = feval(fx, x);
            KQ = (h/3)*(fx(1)+fx(N+1)+4*sum(fx(2:2:N))+2*sum(fx(3:2:N-1)));

        case 'Simpson 3/8'
            if mod(N, 3) ~= 0
                N = N + 1;
            end
            h = (b - a) / N;
            x = a + (0:N) * h;
            fx = feval(fx, x);
            KQ = (3*h/8)*(fx(1)+fx(N+1)+3*sum(fx(2:3:N))+3*sum(fx(3:3:N-1))+2*sum(fx(4:3:N-2)));

    end
end