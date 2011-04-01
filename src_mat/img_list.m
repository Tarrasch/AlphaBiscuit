function [ res ] = img_list( img_dir )
%IMG_LIST Collects all images with criteria
%   Detailed explanation goes here

    if exist(img_dir, 'dir') ~= 7
        error(['Imagefolder `' img_dir '` not found']);
    end

    % get files in folder
    files = dir(img_dir); 
    
    % Remove nonreal files . and ..
    files = files(3:length(files));
    
    % We have images with dimensions 1200*1600*3. 3 is for RGB
    res = zeros(size(files), 1200, 1600, 3);

    for i = 1:size(files)
        path = [img_dir files(i).name]; % Path to current image
        M = double(imread(path)); % We want double-images, not int8
        M = M/255; % Range is [0, 1]
        res(i,:,:,:) = M; % Assignment must be done like this ...
    end

end

