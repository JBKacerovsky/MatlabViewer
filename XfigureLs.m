function XfigureLs()
% XfigureLs - list all '.mat' files in the StreamingAssets folder of the
% MatlabViewer app
% 
% Syntax:  
%     XfigureLs()
% 
% Inputs:
%    no inputs


% Author: J. Benjamin Kacerovsky
% Centre for Research in Neuroscience, McGill University
% email: johannes.kacerovsky@mail.mcgill.ca
% Created: 02-Sep-2020 ; Last revision: 02-Sep-2020 

% ------------- BEGIN CODE --------------


    path = fileparts(mfilename('fullpath'));
    if ismac
        path = strcat(path, '/MatLabViewer_Mac.app/Contents/Resources/Data/StreamingAssets/');
    elseif isunix
        path = strcat(path, '/MatLabViewer_Linux/MatLabViewer_Linux_Data/StreamingAssets/');
    elseif ispc
        path = strcat(path, '\MatLabViewer_Windows\MatlabViewer_Data\StreamingAssets\');
    else
        fprintf("save path not defined for this OS\n");
    end
    
    xFigFiles = dir(strcat(path, '/*.mat'));
    
    fprintf('MatlabViewer save path: \n%s\n''.mat'' files\n\n', path); 
    for i = 1:length(xFigFiles)
        fprintf('%s\tsize: %.2fM\n', xFigFiles(i).name, xFigFiles(i).bytes/1e+06)
    end
end


% ------------- END OF CODE --------------
