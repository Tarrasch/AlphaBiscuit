function [ dist ] = bisc_dist( b1, b2 )
%BISC_DIST Measure biscuit distance
%   Detailed explanation goes here

dist = 0;
for p = ANFields()
    p = char(p);
    a = b1.(p);
    b = b2.(p);
    dist = dist + (a-b)*(a-b);
end

end

