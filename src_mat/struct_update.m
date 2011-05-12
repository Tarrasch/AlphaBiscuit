function [ s ] = struct_update( s, field, modifier)
%STRUCT_UPDATE Update field value with copy semantics

for i = 1:numel(s)
   s(i).(field) = modifier(s(i).(field));
end

end

