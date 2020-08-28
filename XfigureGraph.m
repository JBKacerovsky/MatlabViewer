function XfigureGraph(y, color, x)
    if nargin < 3
        x = linspace(0, length(y), length(y))'; 
    end
    
    if nargin < 2
        color = [0.00001, 0, 0];
    end
    
    % verify number format to be readable by Accord in C#
    x = sizeCheck(x); 
    x = rescale(x); 
    x = intCheck(x); 
    y = sizeCheck(y);
    y = intCheck(y); 
    color = intCheck(color); 
    
    % assemble graph
    Xgraph.y = y; 
    Xgraph.x = x; 
    Xgraph.color = color; 
    Xgraph.type = int32(4);

    % add Xgraph to xFigureObject
    xFigureObject = evalin('base', "xFigureObject"); 
    xFigureObject{end+1} = Xgraph; 
    assignin('base', 'xFigureObject', xFigureObject);
end