% This file contains things I usually always do at startup
% By having this file, I can start working immidietly cause
% I don't need to put in these commands manually all the time


all_files = dir('img/');
biscs = cell(255,1); % 'a' ..'åäö' Should fit


f = @(img) imresize(img, 0.25);
g = @(img) imtobinary(f(img));
h = @(img) calc_properties(g(img));

for file = all_files'
    c = file.name;
    if numel(c) == 1 && c ~= '.'
        foldr = ['img/' c '/'];
        Imgs = img_list(foldr, h);
        biscs{c} = Imgs;
        if(c >= 'c')
            break;
        end
    end
end

clear Imgs c foldr file all_files
clear f g h

% Now add quickshow functions
s  = @(c) imshow(biscs{c}{1}.Image);
sn = @(c, i) imshow(biscs{c}{i}.Image);

w  = @(c) biscs{c}{1};
wn = @(c, i) biscs{c}{i};

% for i = 1:numel(biscs{c})
%     figure(i)
%     imshow(biscs{c}{i}.Image)
% end
% 
% sa = @(c) for i = 1:numel(biscs{c}), figure(i), imshow(biscs{c}{i}.Image), end;
