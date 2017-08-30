it1=imread('convection0000.tif');
it2=imread('convection0001.tif');

figure
imagesc(it1);

figure 
imagesc(it1);
hold
[x, y, u, v] = displacementfield(it1, it2, 32);
quiver(x, y, u, v);

figure
[x, y, u, v] = displacementfield(it1, it2, 32);
quiver(x, y, u, v);