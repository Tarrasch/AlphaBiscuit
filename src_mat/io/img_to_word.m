function [ text ] = img_to_word( path )
%IMG_TO_WORD Read image from disk and give the word meaning
%   

stats = img_to_stat(path);
text = interpret_biscuits(stats, nclassy2);


end

