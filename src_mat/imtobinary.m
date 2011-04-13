function [ img_out ] = imtobinary( img_in )
%IMTOBINARY Turn an RGB image with biscuits to binary image
%   Detailed explanation goes here

img = img_in;
img = imresize(img, 0.5);

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

img_out = b < 0.1;% && g > 50 && g < 100 && r > g  && r < 2*g;

end

