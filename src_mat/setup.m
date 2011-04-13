% This file contains things I usually always do at startup
% By having this file, I can start working immidietly cause
% I don't need to put in these commands manually all the time


all_files = dir('img/');
folders = zeros(0);

for f = all_files'
    disp(f.name)
    if numel(f) == 1
        folders(end) = f.name
    end
end

Imgs = img_list('img/a/');
Im = Imgs{1};

% Resize image first
Im = imresize(Im, 0.5);

Im_bin = imtobinary(Im);
