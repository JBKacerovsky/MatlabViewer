function XfigureGraph(y, color, x)
% XfigureGraph - adds xy line graph data to the xFigureObject cell array
% in the workspace
% line graphs will be displayed in an inset in the MatlabViewer app
% 
% Syntax:  
%     XfigureGraph(y)
%     XfigureGraph(y, color)
%     XfigureGraph(y, color, x)
% 
% Inputs:
%    y - Nx1 or NxM array of y values for the line graph(s)
%        if M == 1 a single line graph will be specified
%        if M >  1 the line to be displayed can be selected using a
%           slider in the 
%        if M >  1 M should be equal to M in XfigurePatch Vertexcolors
%    color - 1x3 RGB array, 
%        if not specified color will default to [0, 0, 0] (black line)
%    x - Nx1 array of values,
%        if not specified will default to all x steps being equal 
% 


% Author: J. Benjamin Kacerovsky
% Centre for Research in Neuroscience, McGill University
% email: johannes.kacerovsky@mail.mcgill.ca
% Created: 02-Sep-2020 ; Last revision: 02-Sep-2020 

% ------------- BEGIN CODE --------------


    if nargin < 3
        x = linspace(0, length(y), length(y))'; 
    end
    
    if nargin < 2
        color = [0.00001, 0, 0];
    end
    
    % verify number format to be readable by Accord in C#
    x = sizeCheck(x); 
    x = rescale(x); 
    x = intCheck(x); 
    y = sizeCheck(y);   
    y = intCheck(y); 
    color = intCheck(color); 
    
    % assemble graph
    Xgraph.y = y; 
    Xgraph.x = x; 
    Xgraph.color = color; 
    Xgraph.type.Graph = [];  % this is a bit of a silly workaround. The Accord reader I am using in unity does not allow me to have data fields of string type, but reads out fieldnames as strings. So I am using the fieldname of a struct with no data to pass in the string "type". seems silly but it works
    % add Xgraph to xFigureObject
    xFigureObject = evalin('base', "xFigureObject"); 
    xFigureObject{end+1} = Xgraph; 
    assignin('base', 'xFigureObject', xFigureObject);
end


% ------------- END OF CODE --------------
