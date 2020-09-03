function Xfigure()
% Xfigure - creates a new xFigureObject in the workspace
%
% when called it creates a new empty cell array 'xFigureObject' in the
% current workspace. XfigurePatch, XfigureScatter3, and XfigureGraph will
% add to the empty object, when called
% 
% Syntax:  
%     Xfigure()
% 
% Inputs:
%    no inputs required
% 

% Author: J. Benjamin Kacerovsky
% Centre for Research in Neuroscience, McGill University
% email: johannes.kacerovsky@mail.mcgill.ca
% Created: 02-Sep-2020 ; Last revision: 02-Sep-2020 

% ------------- BEGIN CODE --------------
    assignin('base', 'xFigureObject', {});
end

% ------------- END OF CODE --------------
