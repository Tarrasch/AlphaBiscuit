function [ character, ix ] = classifier_nearest( biscs, bisc, features)
%CLASSIFY With a set of known biscuit-chars determine arbitrary biscuit
%   Using neigherest neighbour classification

curr_max_dist = inf;

for c = ['a':'z' 'åäö']
    for i = 1:numel(biscs{c})
        d = bisc_dist(biscs{c}{i}, bisc, features);
        if d < curr_max_dist 
            curr_max_dist = d;
            character = c; 
            ix = i;
        end
    end
end

end

