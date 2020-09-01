function XfigureClear(varargin)
    path = fileparts(mfilename('fullpath'));
    if ismac
        path = strcat(path, '/MatLabViewer_Mac.app/Contents/Resources/Data/StreamingAssets/');
    elseif isunix
        path = strcat(path, '/MatLabViewer_Linux/MatLabViewer_Linux_Data/StreamingAssets/');
    elseif ispc
        path = strcat(path, '/MatLabViewer.app/Contents/Resources/Data/StreamingAssets/');
    else

        fprintf("save path not defined for this OS\n");
    end

    tempPath = pwd;
    cd(path);
    % xFigFiles = string(ls('*.mat')); 
    % xFigFiles = strsplit(xFigFiles, '\s', 'DelimiterType', 'RegularExpression');

    xFigFiles = dir('*.mat');

    for i = length(xFigFiles):-1:1
        if(matches(xFigFiles(i).name, varargin))
            xFigFiles(i)=[];
        end
    end

    action = sprintf('delete %s\n', xFigFiles.name);

    eval(action);

cd(tempPath);

