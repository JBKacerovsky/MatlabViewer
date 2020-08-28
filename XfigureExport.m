function XfigureExport(figureTitle, DisplayFigure)
    
if nargin < 1
        figureTitle = "Xfigure";
    end
    
    if nargin < 2
        DisplayFigure = false; 
    end

    path = fileparts(mfilename('fullpath'));
    path = strcat(path, '/MatLabViewer.app/Contents/Resources/Data/StreamingAssets/', figureTitle);
    
    xFigureObject = evalin('base', "xFigureObject"); 
    save(path, "xFigureObject");
    
    if DisplayFigure == true
        XfigureDisplay
    end
end
