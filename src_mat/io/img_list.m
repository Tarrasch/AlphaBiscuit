function [ res ] = img_list( img_dir, varargin )
%IMG_LIST Collects all images within folder. Applying optional function
%   Detailed explanation goes here

    if exist(img_dir, 'dir') ~= 7
        error(['Imagefolder `' img_dir '` not found']);
    end
    
    if size(varargin, 2) > 1
        error('Too many arguments to img_list()');
    end
    f = varargin{1};

    % get files in folder
    files = dir(img_dir); 
    
    % Remove nonreal files . and ..
    files = files(3:length(files));
    n = length(files);
    
    % We have images with dimensions 1200*1600*3. 3 is for RGB
    res = cell(n,1);

    for i = 1:n
        path = [img_dir files(i).name]; % Path to current image
        disp(['Loaded ' path]);
        res{i} = f(imread(path));
    end

end

