function XfigureExport(figureTitle, DisplayFigure)
    
    if nargin < 1
        figureTitle = "Xfigure";
    end
    
    if nargin < 2
        DisplayFigure = false; 
    end
    
    % enforce no white spaces in file names
    % bad practice and XfigureClear will have issues 
    figureTitle = strrep(figureTitle, '\s', '_'); 

    path = fileparts(mfilename('fullpath'));
    if ismac
        path = strcat(path, '/MatLabViewer_Mac.app/Contents/Resources/Data/StreamingAssets/', figureTitle);
    elseif isunix
        path = strcat(path, '/MatLabViewer_Linux/MatLabViewer_Linux_Data/StreamingAssets/', figureTitle);
    elseif ispc
        path = strcat(path, '/MatLabViewer.app/Contents/Resources/Data/StreamingAssets/', figureTitle);
    else
        fprintf("save path not defined for this OS\n");
    end
    
    xFigureObject = evalin('base', "xFigureObject"); 
    save(path, "xFigureObject");
    
    if DisplayFigure == true
        XfigureDisplay
    end
end
