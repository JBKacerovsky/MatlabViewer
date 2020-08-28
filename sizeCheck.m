function x = sizeCheck(x)
% enforces that dim1 > dim2
    if size(x, 2) > size(x, 1)
        x = x';
    end
end