function [ img_out ] = prewitt( img_in )
%PREWITT Apply Prewitt filter
%   Prewitt filter is useful when you want to make clear contours.

dy = [-1, -1, -1;
       0,  0,  0;
       1,  1,  1];
dx = dy';

Iy = filter2(dy, img_in);
Ix = filter2(dx, img_in);

img_out = sqrt(Ix.^2 + Iy.^2);

end

