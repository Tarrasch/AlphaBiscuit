function [ s ] = calc_properties( img )
%CALC_PROPERTIES binary image with one cracker
%   This function highly uses regionsprops, however all
% values returned are normalized with respect to area, automatically.
% Some properties of this function are not supported in regionprops.
% To avoid confusion, all area-netrualized properties start with AN

s = regionprops(img, 'Area' ...
                   , 'Centroid' ...
                   , 'Extent' ...
                   , 'Eccentricity' ...
                   , 'MajorAxisLength' ...
                   , 'Image' ...
                   , 'Perimeter' ...
                   , 'Solidity');


               

% Extract all biscuits, quite likely to go wrong ...
s = extract_biscuits(s); 

% Map this function over the struct             
s = arrayfun(@add_areaneutral_fields, s);

end

