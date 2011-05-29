function [ features ] = backward_elimination( biscs, classifier, features )
%BACKWARD_ELIMINATION Backward eliminate features away
%   Given a data-set, a classifier and a start set of features,
%   calculate the best reduced feature set by backward elimination.

n = numel(features);
best_features = features;
best_cost = analyse_classifier(biscs, classifier, features);
old_cost = best_cost;

for i = 1:n
    red_features = features;
    red_features(i) = [];
    cost = analyse_classifier(biscs, classifier, red_features);
    
    if cost >= best_cost
        best_features = red_features;
        best_cost = cost;
        removed = features{i};
    end
end

if numel(best_features) ~= n % if we did eliminate with advantage
    disp(['Removed ' removed ' to get from ' num2str(old_cost) ' to ' num2str(best_cost)]);
    features = backward_elimination( biscs, classifier, best_features);
end

end

