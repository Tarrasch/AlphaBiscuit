function [ greyscale_img ] = desaturate( rgb_img )
%DESATURATE Summary of this function goes here
%   Detailed explanation goes here

IRed = rgb_img(:,:,1);
IGreen = rgb_img(:,:,2);
IBlue = rgb_img(:,:,3);

pickRGB = [10 5 0];
f = sum(pickRGB);
IMix = (IRed*pickRGB(1) + IGreen*pickRGB(2) + IBlue*pickRGB(3))./(f*sum(rgb_img,3));

greyscale_img = IMix;

end

