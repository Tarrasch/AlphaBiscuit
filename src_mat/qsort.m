function [ sorted index ] = qsort( vector, compfunc )
%QSORT General-purpose sorting function
%   vector - a vector of anything (usually cell array, structs etc)
%   compfunc(a, b) - user-supplied comparision function that returns 0 or 
%                    less for a <= b, greater than zero for a > b
%   Notes: if vector is a cell array, compfunc is passed cell contents
%   sorted - the sorted vector
%   index - indices of unsorted vector
%
m = length(vector);
index = 1:m;
sort_r(1, m);
sorted = vector(index);

    function sort_r(a, b)
        high = b;
        mid = fix( (a + b)/2);
        temp = index(mid);
        index(mid) = index(a);
        index(a) = temp;
        pp = a;
        while(pp < high)
            if(iscell(vector))
                res = compfunc(vector{index(pp)}, vector{index(pp+1)});
            else
                res = compfunc(vector(index(pp)), vector(index(pp+1)));
            end
            if(res == 0)
                res = randi(2) - 1;
            end
            if(res <= 0)
                temp = index(pp);
                index(pp) = index(pp+1);
                index(pp+1) = temp;
                pp = pp+1;
            elseif(res > 0)
                temp = index(pp+1);
                index(pp+1) = index(high);
                index(high) = temp;
                high = high-1;
            end
        end
        if(pp - 1 - a > 0) 
            sort_r(a, pp-1);
        end
        if( b- pp - 1 > 0)
            sort_r(pp+1, b);
        end
    end


end

