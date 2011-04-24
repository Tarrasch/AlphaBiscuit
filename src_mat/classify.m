function [ character ] = classify( biscs, bisc)
%CLASSIFY Summary of this function goes here
%   Detailed explanation goes here

curr_max_dist = inf;

for c = 'a':'c'
    n = numel(biscs{'a'});
    f = @(i) biscs{'a'}{i};
    for i = 1:n
        d = bisc_dist(f(i), bisc);
        if d < curr_max_dist && d > 0.001
            curr_max_dist = d;
            character = c; 
        end
    end
end


end

