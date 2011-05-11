function [ biscs_out ] = normalize_features( biscs )
%NORMALIZE_FEATURES Normalizes the feature fields
%   Detailed explanation goes here


flat_biscs = flatten_cells(biscs);
n = numel(flat_biscs);

for f = ANFields()
    if ~isfield(flat_biscs{1}, f)
        continue;
    end
    col = zeros(n,1);
    for i = 1:n
        col(i) = flat_biscs{1}.(f);
    end
    m = mean(col);
    stddev = std(col);
    for bl = biscs
        for b = bl
            b.(f) = (b.(f)-m)/stddev;
        end
    end
end

end

