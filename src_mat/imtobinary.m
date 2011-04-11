function [ img_out ] = imtobinary( img_in )
%IMTOBINARY Turn an RGB image with biscuits to binary image
%   Detailed explanation goes here

img = img_in;
img = imresize(img, 0.25);


[n, m, ~] = size(img);

img_out = zeros(n, m);

for i = 1:n
    for j = 1:m
        mx = squeeze(img(i, j, :));
        r = mx(1); g = mx(2); b = mx(3);
        res = b < 0.1;% && g > 50 && g < 100 && r > g  && r < 2*g;
        img_out(i, j) = res;
    end
end



end

