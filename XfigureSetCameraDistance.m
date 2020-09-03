function XfigureSetCameraDistance(CamDistance)
% XfigureSetCameraDistance - Sets the Distance of the "Camera"/Player from
% [0, 0, 0]
% 
% Syntax:  
%     XfigureSetCameraDistance(CamDistance)
% 
% Inputs:
%    CamDistance - scalar integer (will be rounded if not int) defining the
%       distance the camera should be from the center point of the scene;

% Author: J. Benjamin Kacerovsky
% Centre for Research in Neuroscience, McGill University
% email: johannes.kacerovsky@mail.mcgill.ca
% Created: 03-Sep-2020 ; Last revision: 03-Sep-2020 

% ------------- BEGIN CODE --------------


    xPatch.CamDistance = uint32([CamDistance, 4]); % for some reason if there's only one int in the array it will not be read correctly into C#,... adding a second number fixes this
    xPatch.type = uint32(6); 
    
    xFigureObject = evalin('base', "xFigureObject"); 
    xFigureObject{end+1} = xPatch; 
    assignin('base', 'xFigureObject', xFigureObject);
end


% ------------- END OF CODE --------------
