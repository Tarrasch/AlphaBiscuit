% This file contains things I usually always do at startup
% By having this file, I can start working immidietly cause
% I don't need to put in these commands manually all the time

all_files = dir('img/');

biscs = load_biscs(chars);

clear Imgs c foldr file all_files
% clear f g h

% Now add quickshow functions
sn = @(c, i) imshow(biscs{c}{i}.Image);
s  = @(c) sn(c,1);
sa = @(c)arrayfun(@(i){figure(i),imshow(biscs{c}{i}.Image)},...
         1:size(biscs{c}),'uniformOutput',false);  


wn = @(c, i) stat_filterprops(biscs{c}{i});
w  = @(c) wn(c,1);

[nbiscs, transform] = normalize_features(biscs);
classy  = @(b) classifier_nearest(biscs, b);
nclassy = @(b) classifier_nearest(nbiscs, b);
nclassy2 = @(b) classifier_nearest(nbiscs, transform(b));

if ~all(arrayfun(@(s) numel(s{1}), flatten_cells(biscs)) == 1)
    disp 'Biscuits are split, they form islands!'
end
