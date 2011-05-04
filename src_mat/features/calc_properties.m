function [ s ] = calc_properties( img )
%CALC_PROPERTIES binary image with one cracker
%   This function highly uses regionsprops, however all
% values returned are normalized with respect to area, automatically.
% Some properties of this function are not supported in regionprops.
% To avoid confusion, all area-netrualized properties start with AN

s = regionprops(img, 'Area' ...
                   , 'Centroid' ...
                   , 'Extent' ...
                   , 'MajorAxisLength' ...
                   , 'Image' ...
                   , 'Perimeter' ...
                   , 'Solidity');


% This will do while we do only character identification
s = extract_biggest_piece(s); 

s = add_areaneutral_fields(s);

end

