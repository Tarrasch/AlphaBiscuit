function [ img_out ] = imtobinary( img_in )
%IMTOBINARY Turn an RGB image with biscuits to binary image
%   Detailed explanation goes here

img = rgb2hsv(img_in);

% First extract colors channels
f = @(img) img;
if max(img) > 1
    f = @(img) double(img)/255;
end
h = f(img(:,:,1));
s = f(img(:,:,2));
v = f(img(:,:,3));

% Apply Gaussian filter
w = fspecial('gaussian', 10, 2);

f = @(img) imfilter(img, w, 'replicate');
h = f(h);
s = f(s);
v = f(v);

h = h.*360;

%img_out = s > 0.5 ...
%        & h > 15 & h < 55 ...
%        & v > 0.20 ;
img_out = h > 15 & h < 55;

end

