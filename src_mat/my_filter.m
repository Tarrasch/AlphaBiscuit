function [ img_out] = my_filter( img_in )
%MY_FILTER Applies a good smoothing filter on image
%   Detailed explanation goes here

w = ones(5, 5)/25;
img_out = filter2(w, img_in);

end

