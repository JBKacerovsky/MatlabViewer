function x = intCheck(x)
    for i = 1 : numel(x)
            temp = x(i) == floor(x(i));
            if temp == false
                return
            end
    end
    x(1) = x(1) - 0.00000001; 
end