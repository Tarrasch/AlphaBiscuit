% This file contains things I usually always do at startup
% By having this file, I can start working immidietly cause
% I don't need to put in these commands manually all the time


all_files = dir('img/');
biscs = cell(255); % 'a' ..'åäö' Should fit

for f = all_files'
    if numel(f.name) == 1 && f.name ~= '.'
        c = f.name;
        foldr = ['img/' c '/'];
        Imgs = img_list(foldr);
        biscs{c} = Imgs;
    end
end

Imgs = img_list('img/a/');
Im = Imgs{1};

% Resize image first
Im = imresize(Im, 0.5);

Im_bin = imtobinary(Im);
