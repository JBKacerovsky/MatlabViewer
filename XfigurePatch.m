function XfigurePatch(fv, vertexcolors, map, facealpha)
    if nargin < 4
        facealpha = 1;
    end
    if nargin < 3
        map = "jet";
    end
    
    if facealpha == floor(facealpha)
        facealpha = facealpha + 0.0001;
    end
    
    temp = fv.faces;
    fv.faces(:, 1) = temp(:, 2); 
    fv.faces(:, 2) = temp(:, 1); 
    
    xPatch.vertices = intCheck(fv.vertices);
    xPatch.faces = uint32(fv.faces)-1; 

    vertexcolors = sizeCheck(vertexcolors); 
    vertexcolors = rescale(vertexcolors); 
    vertexcolors = intCheck(vertexcolors);
    xPatch.colors = vertexcolors; 
    xPatch.map = intCheck(eval(strcat(map, '(', num2str(8), ")")));
    xPatch.opacity = facealpha;
    
    if size(vertexcolors, 2) == 1
        xPatch.type = uint32(1); 
    else
        xPatch.type = uint32(3); 
    end
    
    xFigureObject = evalin('base', "xFigureObject"); 
    xFigureObject{end+1} = xPatch; 
    assignin('base', 'xFigureObject', xFigureObject);
end