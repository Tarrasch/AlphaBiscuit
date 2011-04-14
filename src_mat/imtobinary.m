function [ img_out ] = imtobinary( img_in )
%IMTOBINARY Turn an RGB image with biscuits to binary image
%   Detailed explanation goes here

img = img_in;

% First extract colors channels
f = @(img) double(img)/255;
r = f(img(:,:,1));
g = f(img(:,:,2));
b = f(img(:,:,3));

% Apply Gaussian filter
w = fspecial('gaussian', 1, 2);

f = @(img) imfilter(img, w, 'replicate');
r = f(r);
figure(5), imshow(r);
g = f(g);
figure(6), imshow(g);
b = f(b);
figure(7), imshow(b);

figure(1);
img_out = b < 0.1 & g > 0.2 & g < 0.4 & r > g & r < 3*g;
img_out = (r > g) & (r < 3*g) & (b < 1.4);

end

