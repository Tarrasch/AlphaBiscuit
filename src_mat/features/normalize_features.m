function [ biscs_out ] = normalize_features( biscs )
%NORMALIZE_FEATURES Normalizes the feature fields
%   Detailed explanation goes here

flat_biscs = flatten_cells(biscs);
n = numel(flat_biscs);

for f = ANFields()
    f = f{1};
    if ~isfield(flat_biscs{1}, f)
        continue;
    end
    col = zeros(n);
    for i = 1:n
        col(i) = flat_biscs{i}.(f);
    end
    m = mean(col);
    stddev = std(col);
    
    in_f  = @(elem) elem.(f) = (elem.(f)-m)/stddev;
    arr_f = @(arr) arrayfun(in_f, arr);
    biscs = arrayfun(arr_f, biscs);
%     for bl = biscs
%         for b = bl
%             b.(f)
%             b.(f) = (b.(f)-m)/stddev;
%             b.(f)
%         end
%     end
end

biscs_out = biscs;

end

