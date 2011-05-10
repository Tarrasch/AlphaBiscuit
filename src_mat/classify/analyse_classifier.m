function [ ratio ] = analyse_classifier( biscs, classifier)
%ANALYSE_CLASSIFIER Check classifier quality
%   Given a dataset to work on and a classifier, return how much of

hits = 0;
total = 0;

for c = 'a':'ö'
    n = numel(biscs{c});
    for i = 1:n
        if classify(biscs, c, i, classifier) == c
            hits = hits + 1;
        end
    end
    total = total + n;
end

ratio = hits/total;

end

