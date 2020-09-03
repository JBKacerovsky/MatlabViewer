function XfigureDisplay()
% XfigureDisplay - launches the MatlabViewer app
% 
% Syntax:  
%     XfigureDisplay()
% 
% Inputs:
%    no input
% 

% Author: J. Benjamin Kacerovsky
% Centre for Research in Neuroscience, McGill University
% email: johannes.kacerovsky@mail.mcgill.ca
% Created: 02-Sep-2020 ; Last revision: 02-Sep-2020 

% ------------- BEGIN CODE --------------


path = fileparts(mfilename('fullpath'));
if ismac
    action = strcat("!open ", path, '/MatLabViewer_Mac.app');
    eval(action);
elseif isunix
    action = strcat("!open ", path, '/MatLabViewer_Linux/MatLabViewer_Linux.x86_64');
    eval(action);
elseif ispc
    system(strcat(path, '\MatLabViewer_Windows\MatlabViewer.exe'));
else
    fprintf('filepaths not defined for current OS\n');
end


% ------------- END OF CODE --------------
