function [ img_out ] = contours( img_in )
%CONTOURS Manipulate orginal images to get contour
%   Detailed explanation goes here

img = img_in;
img = imresize(img, 0.5);
img = desaturate(img);
img = my_filter(img); % smoothify
img = prewitt(img);
img = img > 0.05;

figure(123), imshow(img);
img_out = img;

end

