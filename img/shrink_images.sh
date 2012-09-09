#!/bin/bash

for c in {a..z} å ä ö
do
	cd $c &&
    mogrify -resize 33% *.jpg &&
    cd ..
done

