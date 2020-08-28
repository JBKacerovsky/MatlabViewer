function XfigureScatter3(scatterPoints, sphereSize, color)
    if nargin < 3
        color = [0.99999, 0, 0]; 
    end
    if nargin < 2
        sphereSize = repmat(50, 1, length(scatterPoints)); 
    end

    if isscalar(sphereSize)
        sphereSize = repmat(sphereSize, 1, length(scatterPoints)); 
    else
        if size(scatterPoints, 1) == length(sphereSize)
            if size(scatterPoints, 1) ~= size(sphereSize, 2)
                sphereSize = sphereSize'; 
            end
        else
            fprintf('unexpected array size for "sphereSize"\n')
        end

    end

    xScatter3 = []; 
    xScatter3.pts = intCheck(scatterPoints); 
    xScatter3.size = uint32(sphereSize); 
    xScatter3.color = intCheck(color); 
    xScatter3.type = uint32(2); 

    xFigureObject = evalin('base', "xFigureObject"); 
    xFigureObject{end+1} = xScatter3; 
    assignin('base', 'xFigureObject', xFigureObject);
end