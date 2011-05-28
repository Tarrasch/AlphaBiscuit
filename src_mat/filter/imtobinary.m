function [ img ] = imtobinary( img )
%IMTOBINARY Turn an RGB image with biscuits to binary image
%   Detailed explanation goes here

% Apply Gaussian filter
w = fspecial('gaussian', 5, 1);

f = @(img) imfilter(img, w, 'replicate');
r = f(img(:,:,1));
g = f(img(:,:,2));
b = f(img(:,:,3));

%img_out = s > 0.5 ...
%        & h > 15 & h < 55 ...
%        & v > 0.20 ;
img = r > 50 & g > 30 & g < 200 & b < 150 & r > 1.2*g & g > 1.2*b;

end

