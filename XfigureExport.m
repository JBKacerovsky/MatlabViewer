function XfigureExport(figureTitle, DisplayFigure)
% XfigureExport - saves the xFigureObject in the current workspace to the
% StreamingAssets folder of the MatlabViewer app. 
% 
% Syntax:  
%     XfigureExport()
%     XfigureExport(figureTitle)
%     XfigureExport(figureTitle, DisplayFigure)
% 
% Inputs:
%    figureTitle - string; file name for the figure to be saved as
%       Default = 'Xfigure'; 
%    DisplayFigure - bool; if true the app will be launched (to display the
%       figure it will still need to be selected by name from the dropdown
%       menu and rendered using by clicking "Update Figure")
%       Default = false; 
%

% Author: J. Benjamin Kacerovsky
% Centre for Research in Neuroscience, McGill University
% email: johannes.kacerovsky@mail.mcgill.ca
% Created: 02-Sep-2020 ; Last revision: 02-Sep-2020 

% ------------- BEGIN CODE --------------

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
        path = strcat(path, '\MatLabViewer_Windows\MatlabViewer_Data\StreamingAssets\', figureTitle);
    else
        fprintf("save path not defined for this OS\n");
    end
    
    xFigureObject = evalin('base', "xFigureObject"); 
    save(path, "xFigureObject");
    
    if DisplayFigure == true
        XfigureDisplay
    end
end


% ------------- END OF CODE --------------
