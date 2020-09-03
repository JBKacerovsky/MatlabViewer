function XfigureClear(varargin)
% XfigureClear - deletes all previously exported xFigure files by deleting 
% all .mat files from the MatlabViewer Streaming Assets folder. Only
% specified files will be kept.
% 
% Syntax:  
%     XfigureClear(varargin)
%     XfigureClear()
%     XfigureClear('myFileToKeep1', 'myFileToKeep2', 'myFileToKeep3', ....)
%     XfigureClear('myFileToKeep1.mat', 'myFileToKeep2.mat', ....)
% 
% Inputs:
%    varargin - filenames of files which should NOT be deleted can be
%    specified as strings 
% 

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
    
    for i = 1:nargin
        if ~endsWith(varargin{i}, '.mat')
            varargin{i} = strcat(varargin{i}, '.mat');
        end
    end
    
    tempPath = pwd;
    cd(path);
    xFigFiles = dir('*.mat');
    for i = length(xFigFiles):-1:1
        if(matches(xFigFiles(i).name, varargin))
            xFigFiles(i)=[];
        end
    end
    action = sprintf('delete %s\n', xFigFiles.name);
    eval(action);
    
    fprintf('deleting files in \n%s\n', path);
    fprintf('\t%s\n', xFigFiles.name);
    
cd(tempPath);


% ------------- END OF CODE --------------
