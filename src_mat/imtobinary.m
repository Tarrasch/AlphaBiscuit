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
% w = fspecial('gaussian', 15, 2); % UNCOMPILED CODE
w = fspecial('average', 5);

f = @(img) imfilter(img, w, 'replicate');
h = f(h);
s = f(s);
v = f(v);

imhist(h);
h = h.*360;

img_out = s > 0.85 & h > 20 & h < 40 & v > 0.3 & v < 0.65;


end

