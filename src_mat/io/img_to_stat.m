function [ STATS ] = img_to_stat( path )
%IMG_TO_STAT Given image path return stat for image
%   Detailed explanation goes here

STATS = calc_properties(imtobinary(imread(path)));

end

