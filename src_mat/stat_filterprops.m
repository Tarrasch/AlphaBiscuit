function [ out_STATS ] = stat_filterprops( STATS )
%STAT_FILTERPROPS Removes non-measureable fields from the stat
%   Detailed explanation goes here

out_STATS = rmfield(STATS, {'Area', 'Centroid', 'MajorAxisLength', 'Perimeter', 'Image'});

end

