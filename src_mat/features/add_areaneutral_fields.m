function [ s ] = add_areaneutral_fields( s )
%ADD_AREANEUTRAL_FIELDS Summary of this function goes here
%   Detailed explanation goes here

s.ANPerimeter       = s.Perimeter/sqrt(s.Area);
s.ANMajorAxisLength = s.MajorAxisLength/sqrt(s.Area);
s.ANmom1 = stat_momentum(s, 1);
s.ANmom2 = stat_momentum(s, 2);
s.ANmom3 = stat_momentum(s, 3);
s = number_of_holes(s, 0.025);

end

