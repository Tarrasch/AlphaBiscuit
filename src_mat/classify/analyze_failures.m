function [] = analyze_failures( biscs, features )
%ANALYZE_FAILURES Check where failures appear and to which it finds better
%   Detailed explanation goes here

for c = ['a':'z' 'åäö']
    n = numel(biscs{c});
    for i = 1:n
        temp_biscs = biscs;
        bisc = biscs{c}{i};
        biscs{c}(i) = [];
        fbiscs = sort_by_nearest(biscs, bisc, features);
        
        ix = 1;
        while fbiscs{ix}.char ~= c && ix <= numel(fbiscs)
            ix = ix + 1;
        end
        if(ix > 1) % Somebody else was closer
            disp('############### FAILURE ################');
            disp('Failure, other cracker was closer!');
            disp('Orig:')
            disp(stat_filterprops(bisc, features));
            d = num2str(bisc_dist(bisc, fbiscs{1}, features));
            disp(['Best Challenger (' d ') :'])
            disp(stat_filterprops(fbiscs{1}, features));
            d = num2str(bisc_dist(bisc, fbiscs{ix}, features));
            disp(['Closest real (' d ') (' num2str(ix) ') :'])
            disp(stat_filterprops(fbiscs{ix}, features));
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

