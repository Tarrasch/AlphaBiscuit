function [ output_args ] = img_list( img_dir )
%IMG_LIST Collects all images with criteria
%   Detailed explanation goes here

    if exist(img_dir, 'dir') ~= 7
        error(['Imagefolder `' img_dir '` not found']);
    end

    files = dir(img_dir);
    
    res = zeros(size(files)-2);

    for i = 3:size(files)
        res(i-2) = imread(files(i));
    end

end

