function [ fbiscs ] = sort_by_nearest( biscs, bisc )
%SORT_BY_NEAREST Sort and flatten biscs after who is closest bisc.

fbiscs = flatten_cells(add_answer(biscs));
comparator = @(b1, b2) bisc_dist(b2,bisc) - bisc_dist(b1,bisc);
fbiscs = qsort(fbiscs, comparator);

end

