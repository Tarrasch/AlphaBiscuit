function [ r ] = stat_momentum( STATS, exponent)
%UNTITLED Calculate momentum of the binary image.
%   Provide stats with .Image and .Centroid
%   

img = STATS.Image;
[n, m] = size(img);
mx = STATS.Centroid(1); 
my = STATS.Centroid(2);

% A vectorized implementation

% Create position matrixes
dy = (1:n)'*ones(1, m);
dx = ones(n, 1)*(1:m); 

mx =  sum(sum(dx.*img))/STATS.Area;
my =  sum(sum(dy.*img))/STATS.Area;

dy = my - dy;
dx = mx - dx;
ds = sqrt(dx.^2+dy.^2);
ds = ds/sqrt(STATS.Area);
assert(min(min(ds)) >= 0);
ds = ds.^exponent;
ds = ds.*img;
s = sum(sum(ds));
r = s/STATS.Area;


end

