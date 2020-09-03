function x = intCheck(x)
% check if all values in x are integer values 
% if all values are integer x(1) will be converted to non-integer by
% subtracting 1e-09
% exporting an array with all integer values (even if it is double) causes
% issues when reading in with c# when a double[] is expected 
%
    for i = 1 : numel(x)
            temp = x(i) == floor(x(i));
            if temp == false
                return
            end
    end
    x(1) = x(1) - 1e-09; 
end