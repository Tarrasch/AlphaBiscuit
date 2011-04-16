function [ r ] = stat_momentum( STATS, exponent)
%UNTITLED Calculate momentum of the binary image.
%   Provide stats with .Image and .Centroid
%   

img = STATS.Image;
[n, m] = size(img);
mx = STATS.Centroid(1);
my = STATS.Centroid(2);

r = 0;
for i = 1:n
    break;
    dx = mx-i;
    for j = 1:m
        dy = my-j;
        d = sqrt(dx^2+dy^2);
        d = d / sqrt(STATS.Area);
        r = r + img(i, j) * d^exponent;
    end
end
r = r / STATS.Area;


% A vectorized implementation

% Create position matrixes
dy = (1:n)'*ones(1, m);
dx = ones(n, 1)*(1:m); 

dy = my - dy;
dx = mx - dx;
ds = sqrt(dx.^2+dy.^2);
ds = ds.*img;
ds = ds/sqrt(STATS.Area);
ds = ds.^exponent;
s = sum(sum(ds));
r = s/STATS.Area;

end

