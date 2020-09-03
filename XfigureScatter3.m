function XfigureScatter3(scatterPoints, sphereSize, color)
% XfigureScatter3 - adds 3D scatterplot points to the xFigureObject in the
% current workspace
% points will be displayed as spheres at the specified locations
% 
% Syntax:  
%     XfigureScatter3(scatterPoints)
%     XfigureScatter3(scatterPoints, sphereSize)
%     XfigureScatter3(scatterPoints, sphereSize, color)
% 
% Inputs:
%    scatterPoints - Nx3 array of xyz location for points on the scatter
%       plot (each row specifies x, y, z for 1 point)
%    sphereSsize - scalar or Nx1 defining sphere size for each point
%       Default = 50 for all points
%    color - 1x3 RGB array, 
%        if not specified color will default to [1, 0, 0] (red)
%
% CURRENT LIMITATIONS:
% the functions and corresponding app are still somewhat experimental and
% were designed with a specific use in mind. As such there are currently
% some limitations how scatter3 can be used. If you are require any of
% additional capabilities to be included or extended please feel free to 
% contact me at the email below or in the fileexchange/github comments
% I will continue to build this tool set, but it would be helpful to
% receive feedback that/how you are using the tools, and what would
% additional capabilities useful for other users
%       - color: currently only one color can be defined for all points in
%       the scatter plot. for multiple colors XfigureScatter3 would need to
%       be called repeatedly, once for every color 
%       - no alpha: currently setting alpha/opacity is not implemented for
%       XfigureScatter3
%       - variable scatter3: currently using variablepoint
%       locations/colors/sizes to "scroll through" data (like in
%       XfigurePatch or XfigureGraph) is not implemented
%

% Author: J. Benjamin Kacerovsky
% Centre for Research in Neuroscience, McGill University
% email: johannes.kacerovsky@mail.mcgill.ca
% Created: 02-Sep-2020 ; Last revision: 02-Sep-2020 

% ------------- BEGIN CODE --------------

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

% ------------- END OF CODE --------------
