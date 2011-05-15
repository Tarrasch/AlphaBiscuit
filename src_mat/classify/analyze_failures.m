function [] = analyze_failures( biscs )
%ANALYZE_FAILURES Check where failures appear and to which it finds better
%   Detailed explanation goes here

for c = 'a':'ö'
    n = numel(biscs{c});
    for i = 1:n
        temp_biscs = biscs;
        bisc = biscs{c}{i};
        biscs{c}(i) = [];
        fbiscs = sort_by_nearest(biscs);
        
        while fbiscs{ix}.char ~= c && ix <= numel(fbiscs)
            ix = ix + 1;
        end
        if(ix > 1) % Somebody else was closer
            disp('############### FAILURE ################');
            disp('Failure, other cracker was closer!');
            disp('Orig:')
            disp(bisc);
            disp(['Best Challenger: (' num2str(bisc_dist(bisc, biscs{c}{1})) ') '])
            disp(biscs{c}{1});
            disp(['Closest real (' num2str(bisc_dist(bisc, biscs{c}{ix})) ') (' num2str(ix) ') :'])
            disp(biscs{c}{ix});
            disp('');
            
            figure 1, imshow(bisc);
            figure 2, imshow(biscs{c}{1});
            figure 3, imshow(biscs{c}{ix});
            waitforbuttonpress;
        end        
        biscs = temp_biscs;
    end
end



end

