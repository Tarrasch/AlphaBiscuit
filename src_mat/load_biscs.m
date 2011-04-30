function [ biscs ] = load_biscs( range )
%LOAD_BISCS Load range of biscuits from drive
%   You can for example give it 'acg' to load those characters.
%   Another normal use is to give range like ['a':'z' 'åäö']

biscs = cell(255,1); % 'a' ..'åäö' Should fit

f = @(img) imresize(img, 0.25);
g = @(img) imtobinary(f(img));
h = @(img) calc_properties(g(img));

for c = range
    foldr = ['img/' c '/'];
    Imgs = img_list(foldr, h);
    biscs{c} = Imgs;
    if(c >= 'g')
        break;
    end
end


end

