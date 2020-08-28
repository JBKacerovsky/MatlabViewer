Xfigure; 
h1 = starship(0);
h1.vertices = sp.vertices*30; 
XfigurePatch(h1, [1:length(h1.vertices)]', "lines", 0.4); 
h1.vertices = rotateVertices(h1.vertices, -30, 100, 7)-300;
XfigurePatch(h1, [1:length(h1.vertices); length(h1.vertices):-1:1]', "cool"); 
gy = sin(linspace(-2*pi, 2*pi, 150)); 
XfigureGraph(gy, [1, 0, 0]);
gg = rescale([sin(linspace(-4*pi, 4*pi, 150)); cos(linspace(-4*pi, 4*pi, 150))]);
XfigureGraph(gg, [0, 0, 1]); 

XfigureExport("weeeeee"); 
save("weeeeee", "xFigureObject");

%%

figure
plot(gy)