function [ s ] = struct_update( s, field, newvalue)
%STRUCT_UPDATE Update field value with copy semantics
s.(field) = newvalue;
end

