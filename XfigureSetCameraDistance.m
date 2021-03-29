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


    xPatch.camDistance = uint32([CamDistance, 4]); % for some reason if there's only one int in the array it will not be read correctly into C#,... adding a second number fixes this
    
    xPatch.type.SetCamDistance = [];  % this is a bit of a silly workaround. The Accord reader I am using in unity does not allow me to have data fields of string type, but reads out fieldnames as strings. So I am using the fieldname of a struct with no data to pass in the string "type". seems silly but it works
    
    xFigureObject = evalin('base', "xFigureObject"); 
    xFigureObject{end+1} = xPatch; 
    assignin('base', 'xFigureObject', xFigureObject);
end


% ------------- END OF CODE --------------
