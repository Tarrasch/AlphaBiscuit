function [ output_args ] = extract_biscuits( STATS )
%EXTRACT_BISCUITS Given biscs, take out only real bisc islands
%   Detailed explanation goes here

max_area = max(STATS.Area);
STATS = STATS(find(STATS.Area > 0.3*max_area));

end

