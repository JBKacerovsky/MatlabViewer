# Xfigure - Interactive 3D viewer for Matlab meshes/3D scatterplots and graphs built with Unity3d

[![View Xfigure - Interactive 3D viewer on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/79867-xfigure-interactive-3d-viewer)

The functions in this collection can be used to add FV mesh structs, 3D scatterplots and 2D xy plot data to a a cell array called xFigureObject. xFigureObject can then be viewd in an external interactive 3D viewer app (creatively called "MatlabViewer"), which is released with this collection. 

The goal of this app + functions is to make it easier/faster to explore 3D meshes. The app, which was built using the game design platform Unity3D, allows the user to navigate around the exported meshes faster and with higher quality surface rendering than is generally possible using matlab figures (especially for larger meshes), using the Unity Game engine.
Meshes can be rendered with a single, solid colour or using values of a surface function (+colormap) to define vertex colors (similar to 'facevertexcdata'). A set of multiple surface functions/vertex colors can be defined for a mesh. A slider in the app can be used to rapidly switch between veertexcolor datasets to explore different surface data on the same mesh in 3D. 

In addition to meshes the app can display 3D scatter-plots (as spheres of user defined size and color). 
2D xy plots can be displayed in an inset window 

At the moment the Unity built Matlabviewer and the export functions are still somewhat experimental and under development. I bulilt them for specific use cases in an ongoing project and even though I tried to generalize them where I could, they may therefore not be well suited for some other tasks. Since this is still very much a work in progress I woud appreciate any feedback you might have (by email or as comments). If this viewer proves useful to other users I would be happy to keep improving and extending it to include other needed capabilities. 

I tested the current version on MacOS 10.14 with Matlab 2019b and it runs smoothly. I tried to build it so it should also run on Linux and Windows, but have not been able to test it yet. Feedback on OS related issues/bugs would be appreciated. 

The source files for the MatlabViewer Unity Project are located in a seperate git repository:
https://github.com/JBKacerovsky/MatlabViewerUnityProject

<h2> General Usage Overview – exporting from Matlab</h2>

also see demo_Xfigure.m

start by calling 

Xfigure; 

this creates a new empty cell array in the current workspace called xFigureObject (or clears existing cell arrays of that name). All further data will be added to this cell array:

once the figure is defined export it and launch the app by calling 

XfigureExport("name", 1); (0 if you don't want to launch thee app yet) 

this will save xFigureeObject to a folder called "streamingAssets" in the app datastructure

<h3> functions to add data </h3>
XfigurePatch - adds FV mesh with vertex colors. If the vertexcolor array has >1 column it will be added as a variable vertexcolor mesh. In the current version only one variable vertexcolor mesh should be defined per scence/xFigureObject

XfigurePatchSingleColor - adds FV mesh with a single color

XfigureScatter3 - adds 3D scatter plot from array of point locations (xyz coordinates) 

XfigureGraph - adds 2d xy plot from y data array. if the ydata array has >1 column it will be created as a variable data 2D plot. In the current version the y-data for variable data plots should have the same number of columns as vertexcolor columns of a variable XfigurePatch 

XfigureSetCameraDistance - allows the user to define the starting7default location of the camera (default if not defined = 3000). the camera will alwas be located at x=0 and y=0 at the start and point at 0,0,0. Using this function the user can define the z location of the camera (i.e. distance from the center of the scene) 

<h3> "helper functions" </h3>

XfigureClear will delete all previously exported xFigure files from the StreamingAssets folder, exceptions can be defined manually

XfigureLs will display the names of all currently saved xFigure files in the StreamingAssets folder

xfigureDisplay launches the app


<h2> General Usage Overview – MatlabViewer App</h2>

the app always launches empty. you can launch the app directly as a program or from Matlab (depending on security setting you might have to give permission) by calling XfigureDisplay or when calling XfigureExport by setting the DisplayFigure value to one

to display an exported scene, select the figure by name from the dropdown menu and click "UpdateFigure" (this can also be used to update the figure if the data has been changed) 

to unlock navigation (rotation and zoom) click the button "Camera Orbit" or click the "C" key. Once unlocked the view can be rotated (around the center) by using mouse click+drag. To zoom use mouse scroll. By clicking "Camera Orbit" or the "C" key again the view can be locked. 

to unlock panning  click the button "Camera Pan" or click the "P" key. Once unlocked the view can be panned (also changing the center of rotation) by using mouse click+drag. By clicking "Camera Pan" or the "P" key again the view can be locked. 

to unlock rotation of the light sources click the button "Light Orbit" or click the "l" key. Once unlocked the lightsourcees can be rotated around the centre of view by using mouse click+drag to change the angle of illumination . By clicking "Light Orbit" or the "L" key the position of the light sources can be locked. 

to show/hide the graph inset click the button. the size of the inset window can be changed using the buttons in the lower left corner of the inset. 

if a mesh is defined as a variable data mesh (i.e. >1 column for vertexcolors) a slider will appear at the bottom of the Viewer. This slider can be used to select which dataset/column should be displayed and to navigate between them. If a variable data plot is defined the slider will also set wich dataset should be displayed. 
(note that in the current version the slider appearance is set ONLY by the mesh object. therefore a variable data plot can only be displayed properly if there is also a variable data mesh with the same number of data columns) 

