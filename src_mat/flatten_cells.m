function C = flatten_cells(A)
%FLATTEN_CELLS Flatten cell arrays, even nested ones
% 
% C1 = flatten({{1 {2 3}} {4 5} 6})
% C2 = flatten({{'a' {'b','c'}} {'d' 'e'} 'f'})
% 
% Outputs:
% C1 = 
%     [1]    [2]    [3]    [4]    [5]    [6]
% C2 = 
%     'a'    'b'    'c'    'd'    'e'    'f'
%
% Copyright 2010  The MathWorks, Inc.
% 
% Stolen by Arash 
C = {};
for i=1:numel(A)  
    if(~iscell(A{i}))
        C = [C,A{i}];
    else
       Ctemp = flatten_cells(A{i});
       C = [C,Ctemp{:}];
       
    end
end

