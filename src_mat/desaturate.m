function [ greyscale_img ] = desaturate( rgb_img )
%DESATURATE Summary of this function goes here
%   Detailed explanation goes here

IRed = rgb_img(:,:,1);
IGreen = rgb_img(:,:,2);
% IBlue = Im(:,:,3);
IYell = (IRed + IGreen)./(2*sum(Im,3));

greyscale_img = IYell;

end

