function [ properties ] = calc_properties( img )
%CALC_PROPERTIES binary image with one cracker
%   This function highly uses regionsprops, however all
% values returned are normalized with respect to area, automatically.
% Some properties of this function are not supported in regionprops.
% To avoid confusion, all area-netrualized properties start with AN

s = regionprops(img, 'Area', 'Centroid', 'Extent', 'MajorAxisLength', 'Image', 'Perimeter', 'Solidity');


s.ANPerimeter       = s.Perimeter/sqrt(s.Area);
s.ANMajorAxisLength = s.MajorAxisLength/sqrt(s.Area);

% Commented out temporairly for efficiency
% s.ANmom1 = stat_momentum(s, 1);
% s.ANmom2 = stat_momentum(s, 2);
% s.ANmom3 = stat_momentum(s, 3);



properties = s;

end

