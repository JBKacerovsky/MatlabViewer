function XfigurePatch(fv, vertexcolors, map, facealpha)
% XfigurePatch - adds a mesh object with defined vertex colors to the
% xFigureObject int the current workspace
% variable vertex colors allow for scroling through vertexcolor data
%
% CURRENT LIMITATIONS:
% the functions and corresponding app are still somewhat experimental and
% were designed with a specific use in mind. As such there are currently
% some limitations how fv objects can be used. If you are require any of
% these capabilities to be included/extended please feel free to contact me
% at the email below or in the fileexchange/github comments
% I will continue to build this tool set, but it would be helpful to
% receive feedback that/how you are using the tools, and what would
% additional capabilities useful for other users
%       - no vertexalpha: currently alpha/opacity can only be defined for
%       the entire object
%       - variable vertex colors: in the current version there should only
%       be one mesh object with variable vertex colors (to be controlled
%       using the slider) 
%       - no edgecolor: in the current vresion edges are not displayed
%
% Syntax:  
%     XfigurePatch(fv, vertexcolors)
%     XfigurePatch(fv, vertexcolors, map)
%     XfigurePatch(fv, vertexcolors, map, facealpha)
% 
% Inputs:
%    fv - FV struct defining triangulated mesh
%       fields should be fv.vertices
%                        fv.faces
%       (e.g. output of isosurface.m)
%    vertexcolos - Nx1 or NxM array of values defining veertex colors
%       N = size(fv.vertices, 1)
%       if M == 1 a single line graph will be specified
%       if M >  1 the line to be displayed can be selected using a
%           slider in the 
%       if M >  1 M should be equal to M in XfigurePatch Vertexcolors
%
%    map - string to select any of the builtin colormaps
%       default = 'jet';
%    facealpha – scalar (0<=facealpha<=1) defining alpha/opacity of mesh
%       default = 1 (solid; 100% opaque)
% 
% 
% Example: 
%     XfigurePatch(fv, vertexcolors, 'cool', 0.3);
% 

% Author: J. Benjamin Kacerovsky
% Centre for Research in Neuroscience, McGill University
% email: johannes.kacerovsky@mail.mcgill.ca
% Created: 02-Sep-2020 ; Last revision: 02-Sep-2020 

% ------------- BEGIN CODE --------------


    if nargin < 4
        facealpha = 1;
    end
    if nargin < 3
        map = "jet";
    end
    
    if facealpha == floor(facealpha)
        facealpha = facealpha + 0.0001;
    end
        
%     temp = fv.faces;
%     fv.faces(:, 1) = temp(:, 2); 
%     fv.faces(:, 2) = temp(:, 1); 
    
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


% ------------- END OF CODE --------------
