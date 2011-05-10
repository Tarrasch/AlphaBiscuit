function [ s ] = extract_biggest_piece( ss )
%EXTRACT_BIGGEST_PIECE Summary of this function goes here
%   Detailed explanation goes here

if numel(ss) == 0
    error('No part exists at all. Perhaps to hard filtering?');
end

i = 1;
n = numel(ss);
for j = 1:n
    if ss(j).Area > ss(i).Area
        i = j;
    end
end

s = ss(i);

end

