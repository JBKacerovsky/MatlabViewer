function XfigureDisplay()
path = fileparts(mfilename('fullpath'));

if ismac
    action = strcat("!open ", path, '/MatLabViewer_Mac.app');
    eval(action);
elseif isunix
    action = strcat("!open ", path, '/MatLabViewer_Linux/MatLabViewer_Linux.x86_64');
    eval(action);
elseif ispc
    system(strcat(path, '\MatLabViewer_Mac.app'));
end