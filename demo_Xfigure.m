%% build example objects
% the test objects in this file are built using functions in: 
% J. Benjamin Kacerovsky (2020). Build mesh or voxel spheres, ellipsoids, and test objects 
% (https://www.mathworks.com/matlabcentral/fileexchange/75241-build-mesh-or-voxel-spheres-ellipsoids-and-test-objects)
% MATLAB Central File Exchange. Retrieved June 10, 2020.

% build example mesh as a FV struct (see isosurface) 
ship=starship(0);
ship.vertices = ship.vertices*10 + [-800, 200, 600];

% create "planet" as sphere;  by stringing together a couple of
% trigfunctions I can create a complicated banding pattern to colour the
% surface
planet=meshSphereCreator(500, 'step', 20); 
[X, Y, Z]=meshgrid(-500:10:500, -500:10:500, -500:10:500); 
C=sin(tan((X+10)*0.1).*2).*sin(tan((X+12).*-0.09).*2.1)+sin(X+Y.*-0.2).*sin(X.*0.2+Y.*0.2)*0.4;
C=C.*sin(X.*0.2); 
cPlan=isocolors(X, Y, Z, C, planet.vertices);

rotMat=[cosd(-110), -sind(-110), 0;
        sind(-110), cosd(-110), 0;
        0, 0, 1];
    
planet.vertices=planet.vertices*rotMat;

% create concentric squashed rings around the sphere with concentric
% colour pattern
R=[920, 1040, 1180, 1300, 1400, 1480];
r=[34, 30, 40, 30, 40, 50]; 
stepSize=15;

centres=zeros(length(R), 3); 
deform=repmat([1, 2.5, 1], length(R), 1);
rotation=repmat([0, 10, 20], length(R), 1);
rings=multiMeshToroidCreator(R, r, centres, deform, rotation, stepSize);
dist = sum(rings.vertices.^2, 2).^1/2;

cRings = [sin(dist/5e+04), cos(dist/5e+04)];

%% define some data for graphing 
% for graphing cRings values
% for variable graphs the number of columns shoud be equal to the number of
% columns in a variable vertexcolor mesh object
dd=linspace(min(dist), max(dist), 500)'; 
ringGraph = rescale([sin(dd/5e+04), cos(dd/5e+04)]); 

planGraph=rescale(unique(cPlan, 'stable')); 
planGraph=planGraph(1:1000); 

%% define points for a scatterplot
pts = (rand(300, 3)-0.5)*5000;
%
for i = 1:300
    sel = randi(3, 1, 1);
    pts(i, sel) = pts(i, sel)+2000*sign(pts(i, sel)); 
end
sz = randi([30, 80], 1, 300); 

%% build and export Xfigure object

% start by creating a new Xfigure (an empty cell array "xFigureObject" will 
% be saved to the curren workspace)
Xfigure; 

% add starship as a single solid color mesh
XfigurePatchSingleColor(ship, [1, 0, 1], 1); 

% add planet with constat vertex color data
XfigurePatch(planet, cPlan, 'jet', 1); 

% add rings with variable vertex color data
% in the Viewer a slider can be used to select which data is shown 
XfigurePatch(rings, cRings, 'hsv', 0.3);

% add 3D scatterplot
XfigureScatter3(pts, sz, [1, 1, 0]);


% add constant graph data (this is not very meaningful in terms of data
% but should demonstrate how  graphs can be defined and used) 
XfigureGraph(planGraph); 

% add variable graph data
XfigureGraph(ringGraph, [0, 0, 1]);

% define camera distance from the centre of the scene
XfigureSetCameraDistance(2200); 
% export figure and launch app
XfigureExport('shipAndPlanet', 1); 


