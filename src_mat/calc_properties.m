function [ properties ] = calc_properties( img )
%CALC_PROPERTIES binary image with one cracker
%   This function highly uses regionsprops, however all
% values returned are normalized with respect to area, automatically.
% Some properties of this function are not supported in regionprops.

s = regionprops(img, 'Area', 'Centroid', 'Extent', 'MajorAxisLength', 'Image', 'Perimeter', 'Solidity');


s.Perimeter= s.Perimeter/sqrt(s.Area);
s.MajorAxisLength= s.MajorAxisLength/sqrt(s.Area);

s.mom1 = stat_momentum(s, 1);
s.mom2 = stat_momentum(s, 2);
s.mom3 = stat_momentum(s, 3);



properties = s;

end

