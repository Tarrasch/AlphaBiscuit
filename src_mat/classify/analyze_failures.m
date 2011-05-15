function [] = analyze_failures( biscs, classifier )
%ANALYZE_FAILURES Check where failures appear and to which it finds better
%   Detailed explanation goes here

for c = 'a':'ö'
    n = numel(biscs{c});
    for i = 1:n
        if classify(biscs, c, i, classifier) ~= c
            
        end
    end
end



end

