function XfigurePatchSingleColor(fv, color, facealpha)
% XfigurePatch - adds a mesh object. the mesh object has one color
%
% Syntax:  
%     XfigurePatchSingleColor(fv)
%     XfigurePatchSingleColor(fv, color)
%     XfigurePatchSingleColor(fv, color, facealpha)
% 
% Inputs:
%    fv - FV struct defining triangulated mesh
%       fields should be fv.vertices
%                        fv.faces
%       (e.g. output of isosurface.m)
%    color - 1x3 RGB triplet (values between 0 and 1) that defines the
%       color of the mesh 
%       default = [0, 0, 1]; (blue); 
%    facealpha – scalar (0<=facealpha<=1) defining alpha/opacity of mesh
%       default = 1 (solid; 100% opaque)
% 
% Example: 
%     XfigurePatch(fv, vertexcolors, 'cool', 0.3);
% 

% Author: J. Benjamin Kacerovsky
% Centre for Research in Neuroscience, McGill University
% email: johannes.kacerovsky@mail.mcgill.ca
% Created: 02-Sep-2020 ; Last revision: 02-Sep-2020 

% ------------- BEGIN CODE --------------


    if nargin < 3
        facealpha = 1;
    end
    if nargin < 2
        color = [0, 0, 0.99999];
    end
    
    if facealpha == floor(facealpha)
        facealpha = facealpha + 0.0001;
    end
        
    temp = fv.faces;
    fv.faces(:, 1) = temp(:, 2); 
    fv.faces(:, 2) = temp(:, 1); 
    
    xPatch.vertices = intCheck(fv.vertices);
    xPatch.faces = uint32(fv.faces)-1; 
    xPatch.color = intCheck(color); 
    xPatch.opacity = facealpha;
    
    xPatch.type = uint32(5); 
    
    xFigureObject = evalin('base', "xFigureObject"); 
    xFigureObject{end+1} = xPatch; 
    assignin('base', 'xFigureObject', xFigureObject);
end


% ------------- END OF CODE --------------
