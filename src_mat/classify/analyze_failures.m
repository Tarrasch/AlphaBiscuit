function [] = analyze_failures( biscs )
%ANALYZE_FAILURES Check where failures appear and to which it finds better
%   Detailed explanation goes here

for c = 'a':'ö'
    n = numel(biscs{c});
    for i = 1:n
        temp_biscs = biscs;
        bisc = biscs{c}{i};
        biscs{c}(i) = [];
        fbiscs = sort_by_nearest(biscs, bisc);
        
        ix = 1;
        disp(fbiscs{ix}.char)
        disp(c)
        while fbiscs{ix}.char ~= c && ix <= numel(fbiscs)
            ix = ix + 1;
        end
        if(ix > 1) % Somebody else was closer
            disp('############### FAILURE ################');
            disp('Failure, other cracker was closer!');
            disp('Orig:')
            disp(bisc);
            disp(['Best Challenger (' num2str(bisc_dist(bisc, fbiscs{1})) ') :'])
            disp(fbiscs{1});
            disp(['Closest real (' num2str(bisc_dist(bisc, fbiscs{ix})) ') (' num2str(ix) ') :'])
            disp(fbiscs{ix});
            disp('');
            
            figure(1), imshow(bisc.Image);
            figure(2), imshow(fbiscs{1}.Image);
            figure(3), imshow(fbiscs{ix}.Image);
            waitforbuttonpress;
        end        
        biscs = temp_biscs;
    end
end



end

