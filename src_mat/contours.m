function [ img_out ] = contours( img_in )
%CONTOURS Manipulate orginal images to get contour
%   Detailed explanation goes here

img = img_in;
img = imresize(img, 0.5); figure(1), imshow(img);
img = desaturate(img); figure(2), imshow(img);
img = my_filter(img); figure(3), imshow(img); % smoothify 
img = prewitt(img); figure(4), imshow(img);
img = img > 0.05; figure(5), imshow(img);

img_out = img;

end

