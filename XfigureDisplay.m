function XfigureDisplay()
path = fileparts(mfilename('fullpath'));
action = strcat("!open ", path, '/MatLabViewer.app');

eval(action);