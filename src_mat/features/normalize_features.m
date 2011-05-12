function [ biscs, transform ] = normalize_features( biscs )
%NORMALIZE_FEATURES Normalizes the feature fields
%   Detailed explanation goes here

flat_biscs = flatten_cells(biscs);
n = numel(flat_biscs);
transform = @(s) s;

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
    
    for i = 1:numel(biscs)
        for j = 1:numel(biscs{i})
           for k = 1:numel(biscs{i}{j})
               biscs{i}{j}(k).(f) = (biscs{i}{j}(k).(f)-m)/stddev;
           end
        end
    end
    
    transform = @(s) struct_update(transform(s), f, @(v)(v-m)/stddev);
end

end

