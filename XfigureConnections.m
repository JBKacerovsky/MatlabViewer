function XfigureConnections(shootingTarget, connectedTarget, direct)
% XfigureConnections - One line description of what the function or script performs (H1 line)
% Optional file header info (to give more details about the function than in the H1 line)
% Optional file header info (to give more details about the function than in the H1 line)
% Optional file header info (to give more details about the function than in the H1 line)
% 
% Syntax:  
%     XfigureConnections(shootingTarget, connectedTarget, direct)
% 
% Inputs:
%    shootingTarget - 1xn array specifying targets which can be highlighted
%    connectedTarget - 1xn cell array. each cell specifies the number of
%               connected objects that should be highlighted once the
%               target is highlighteds
%    direct - bool if true the array is used to specify direct connections
%               (direct connections will be highlighted as soon as the
%               target is highlighted). 
%               fals for indirect connections (if the target is
%               highlighted/active the next set of connected objects can
%               are highlighted by button P press) 
% 
% Outputs:
%    output1 - Description
%    output2 - Description
% 
% Example: 
%    Line 1 of example
%    Line 2 of example
%    Line 3 of example
% 
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
% 
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: J. Benjamin Kacerovsky
% Centre for Research in Neuroscience, McGill University 
% email: johannes.kacerovsky@mail.mcgill.ca
% Created: 08-Apr-2021 ; Last revision: 08-Apr-2021 

% ------------- BEGIN CODE --------------

    if nargin <3 
        direct = true; 
    end
    
    if direct == true
        directionString = "DirectConnections"; 
    else
        directionString = "IndirectConnections";
    end
    
    
    for i = 1:length(shootingTarget)
        temp.(directionString).(strcat("target_", num2str(shootingTarget(i)))) = uint32(connectedTarget{i}); 
    end
    
    temp.type.ConnectionDictionary = [];  % this is a bit of a silly workaround. The Accord reader I am using in unity does not allow me to have data fields of string type, but reads out fieldnames as strings. So I am using the fieldname of a struct with no data to pass in the string "type". seems silly but it works
    
    xFigureObject = evalin('base', "xFigureObject"); 
    xFigureObject{end+1} = temp; 
    assignin('base', 'xFigureObject', xFigureObject);
end


% ------------- END OF CODE --------------
