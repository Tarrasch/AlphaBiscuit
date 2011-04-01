function [ output_args ] = img_list( ~ )
%IMG_LIST Collects all images with criteria
%   Detailed explanation goes here

    img_dir = 'img';

    if exist(img_dir, 'dir') ~= 7
        error('Folder not found');
    end

    files = dir(img_dir);

    for i = 1:size(files)
        disp(files(i));
    end

end

