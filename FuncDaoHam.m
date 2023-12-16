function KQ = FuncDaoHam(x, y, fx, dh, h, pp, ss, Hoac)
    if(length(x) ~= length(y))
        fprintf('x và y BẮT BUỘC phải cùng độ dài');
    end

    fx = matlabFunction(str2sym(fx));
    
    switch(Hoac)
        case 'Dữ liệu'
            fx = y;
            h = x(2)-x(1);
            h1 = 1;
            dh = floor((dh-x(1))/h)+1;

        case 'Hàm số'
            h1 = h;

    end

    switch(ss)
        case 'O(h^2)'
            if pp == "Xấp xỉ tiến"
                KQ = (-fx(dh+2*h1) + 4*fx(dh+h1) - 3*fx(dh)) / (2*h);
            elseif pp == "Xấp xỉ lùi"
                KQ = (3*fx(dh) - 4*fx(dh-h1) + fx(dh-2*h1)) / (2*h);
            else
                KQ = (fx(dh+h1) - fx(dh-h1)) / (2*h);
            end

        case 'O(h)'
            if pp == "Xấp xỉ tiến"
                KQ = (fx(dh+h1) - fx(dh)) / (h);
            elseif pp == "Xấp xỉ lùi"
                KQ = (fx(dh) - fx(dh-h1)) / (h);
            else
                fprintf('Vui lòng chỉnh lại phương pháp chọn Đạo Hàm');
                KQ = NaN;
            end

    end
end