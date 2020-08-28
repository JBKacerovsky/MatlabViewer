function XfigureExport(figureTitle)
    path = fileparts(mfilename('fullpath'));
    path = stcat(path, '/MatLabViewer.app/Contents/Resources/Data/StreamingAssets/', figureTitle);
    
end
