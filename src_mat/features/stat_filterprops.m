function [ out_STATS ] = stat_filterprops( STATS )
%STAT_FILTERPROPS Removes non-measureable fields from the stat
%   Detailed explanation goes here

fields = {'Area' ...
        , 'Centroid' ...
        , 'MajorAxisLength' ...
        , 'Perimeter' ...
        , 'Image'};

for f = fields
    if isfield(STATS, f)
        STATS = rmfield(STATS, fields);
    end
end
    
out_STATS = STATS;
end

