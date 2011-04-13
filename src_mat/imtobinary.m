function [ img_out ] = imtobinary( img_in )
%IMTOBINARY Turn an RGB image with biscuits to binary image
%   Detailed explanation goes here

img = img_in;

% First extract colors channels
r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

% Apply Gaussian filter
w = fspecial('gaussian', 15, 2);

r = filter2(w, r);
g = filter2(w, g);
b = filter2(w, b);

img_out = b < 0.1;% && g > 50 && g < 100 && r > g  && r < 2*g;

end

