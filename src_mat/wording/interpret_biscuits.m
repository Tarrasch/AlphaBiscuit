function [ text ] = interpret_biscuits( s, classifier )
%INTERPRET_BISCUITS Sweep through characters and make words
%   The biscuits are expected to be spread around like words on
%   a paper, firstly from top to bottom and then left to right.

n = numel(v);
text = [];
p = max([s.Perimeter])/2; % give or take

y0 = 0; x0 = 0; 

for loop_num = 1:n
    best_ix = -1;
    best_dist = -1;
    for j = 1:n        
        dx = s(j).Centroid(1) - x0;
        dy = s(j).Centroid(2) - y0;       
        fdy = floor(dy/p);
        dist = fdy*1000000 + dx;
        if dist > 0 && dist > best_dist 
            best_ix = j;
            best_dist = dist;
            newline = fdy;
            space = dx/p;
        end
    end
    if newline >= 1
        text = [text '\n'];
    elseif space >= 1
        text = [text ' '];
    end
    text = [text classifier(s(best_ix))];    
end

end

