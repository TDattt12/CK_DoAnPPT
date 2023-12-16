function [KQ, PT, d] = FuncNoiSuy(x, y, n, x1, ns, pp)
    if(length(x) ~= length(y))
        fprintf('x và y BẮT BUỘC phải cùng độ dài');
    end

    switch(pp)
        case 'Newton'
            N = zeros(n,n);
            N(:, 1) = y';
      
            for i=2:n
                for j = 1:(n+1-i)
                    N(j,i) = (N(j+1,i-1)-N(j,i-1))/(x(j+i-1)-x(j));
                end
            end
            a=N(1,:);
            d=a(n);
            for k = n-1:-1:1
                d=[d a(k)] - [0 d*x(k)];
            end

        case 'Lagrange'
            L = zeros(n,n);
            for i=1:n
                V = 1;
                for j = 1:n
                    if i ~= j
                        V = conv(V,poly(x(j)))/(x(i)-x(j));
                    end
                end
                L(i,:) = V;
            end
            d = y*L;
                                                   
    end
    PT = polyval(d,x1);
    KQ = polyval(d,ns);    
end