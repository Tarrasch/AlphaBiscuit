function [ dist ] = bisc_dist( b1, b2)
%BISC_DIST Summary of this function goes here
%   Detailed explanation goes here

b1 = stat_filterprops(b1);
b2 = stat_filterprops(b2);

props1 = fieldnames(b1);
props2 = fieldnames(b2);

if props1 ~= props2
    error('Biscuits should have same properties type');
end

props = props1;
n = numel(props);
dist = 0;

for p_str = props
    a = getfield(b1, p_str);
    b = getfield(b2, p_str);
    sum = a + b; % kind of assuming a,b > 0
    diff_abs = abs(a-b);
    delta = diff_abs/sum;
    dist = dist + delta/n;
end

end

