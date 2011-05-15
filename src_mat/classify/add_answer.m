function [ biscs ] = add_answer( biscs )
%ADD_ANSWER Add to each struct which character it is

for c = 'a':'ö'
    n = numel(biscs{c});
    for i = 1:n
        biscs{c}{i}.char = c;
    end
end

end

