% This file contains things I usually always do at startup
% By having this file, I can start working immidietly cause
% I don't need to put in these commands manually all the time


all_files = dir('img/');
biscs = cell(255,1); % 'a' ..'åäö' Should fit

for f = all_files'
    if numel(f.name) == 1 && f.name ~= '.'
        c = f.name;
        foldr = ['img/' c '/'];
        f = @(img) calc_properties(imtobinary(imresize(img, 0.25)));
        Imgs = img_list(foldr, f);
        biscs{c} = Imgs;
        if(c >= 'e')
            break;
        end
    end
end

Im = biscs{'a'}{1};

% Resize image first
% Im = imresize(Im, 0.5);

% Im_bin = imtobinary(Im);
