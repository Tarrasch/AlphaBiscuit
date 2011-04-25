function [ ratio ] = analyse_classifier( biscs, classifier)
%ANALYSE_CLASSIFIER Check classifier quality
%   Given a dataset to work on and a classifier, return how much of

hits = 0;
total = 0;

for c = 'a':'ö'
    n = numel(biscs{c});
    f = @(i) biscs{c}{i};
    for i = 1:n
        data_set = biscs;
        data_set{c}(i) = [];
        res = classifier(data_set, f(i));
        if c == res
            hits = hits + 1;
        end
    end
    total = total + n;
end

ratio = hits/total;

end

