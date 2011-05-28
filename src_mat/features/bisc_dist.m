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

% b1 = stat_filterprops(b1);
% b2 = stat_filterprops(b2);
% 
% f = @(b) fieldnames(b);
% props1 = f(b1);
% props2 = f(b2);
% 
% f = @(x) char(x);
% if all(f(props1) ~= f(props2))
%     error('Biscuits should have same properties type');
% end
% 
% props = props1;
% n = numel(props);
% dist = 0;
% 
% for i = 1:n
%     p_str = props{i};
%     a = b1.(p_str);
%     b = b2.(p_str);
%     dist = dist + (a-b)*(a-b);
% end
% dist = sqrt(dist); % not really neccesary but ok

end

