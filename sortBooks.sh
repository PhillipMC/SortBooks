#!/bin/bash
IFS=$'\n'
VAR=0
for i in $(find . -maxdepth 1 -type "d" | tail -n +2); do
cd $i
	mkdir -p epub pdf mobi
	find -maxdepth 1 -type "f" -iname "*.epub" | xargs -r mv -t epub
	find -maxdepth 1 -type "f" -iname "*.mobi" | xargs -r mv -t mobi
	find -maxdepth 1 -type "f" -iname "*.pdf" | xargs -r mv -t pdf
	cd ..
done
find -maxdepth 2 -type "d" -empty | xargs -d '\n' rm -r
