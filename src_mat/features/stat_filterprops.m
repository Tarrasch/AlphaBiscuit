function [ out_STATS ] = stat_filterprops( STATS, fields )
%STAT_FILTERPROPS Removes non-measureable fields from the stat
%   Detailed explanation goes here

fields_to_remove = setdiff(fieldnames(STATS), fields);

for f = fields_to_remove
    if isfield(STATS, f)
        STATS = rmfield(STATS, f);        
    end
end
    
out_STATS = STATS;
end

