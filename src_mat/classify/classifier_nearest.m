function [ character, ix ] = classifier_nearest( biscs, bisc)
%CLASSIFY With a set of known biscuit-chars determine arbitrary biscuit
%   Using neigherest neighbour classification

curr_max_dist = inf;

for c = 'a':'ö'
    n = numel(biscs{c});
    f = @(i) biscs{c}{i};
    for i = 1:n
        d = bisc_dist(f(i), bisc);
%         disp([c '(' num2str(i) '): ' num2str(d)]); 
        if d < curr_max_dist 
            curr_max_dist = d;
            character = c; 
            ix = i;
        end
    end
end


end

