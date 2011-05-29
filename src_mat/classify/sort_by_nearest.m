function [ fbiscs ] = sort_by_nearest( biscs, bisc, features )
%SORT_BY_NEAREST Sort and flatten biscs after who is closest bisc.

fbiscs = flatten_cells(add_answer(biscs));
comparator = @(b1, b2) bisc_dist(b2,bisc, features) ...
                     - bisc_dist(b1,bisc, features);
fbiscs = qsort(fbiscs, comparator);

end

