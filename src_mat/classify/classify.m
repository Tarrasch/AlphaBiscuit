function [ character ] = classify( biscs, c, i, classifier, features)
%CLASSIFY Helper when using a classifier
%   Using neigherest neighbour classification

bisc  = biscs{c}{i};
biscs{c}(i) = [];
character = classifier(biscs, bisc, features);

end

