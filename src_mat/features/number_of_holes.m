function [ s ] = number_of_holes( s, threshold )
%NUMBER_OF_HOLES Given a stats adds num_holes to struct

hole_image = s.FilledImage - s.Image;
hole_image = bwlabeln(hole_image);
props = regionprops(hole_image, 'Area');

count = 0;
for i = 1:numel(props)
    if props(i).Area > s.Area*threshold
        count = count + 1;
    end
end

s.num_holes = count;
 
end

