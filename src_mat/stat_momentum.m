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
    dx = mx-i;
    for j = 1:m
        dy = my-j;
        d = sqrt(dx^2+dy^2);
        r = r + img(i, j) * d^exponent;
    end
end
r = r / STATS.Area;

end

