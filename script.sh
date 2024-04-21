#!/bin/bash

IFS=$'\n'
find "$1" -maxdepth 1 -type f
find "$1" -maxdepth 1 -type d
find "$1" -type f
files_in_input_recursive=$(find "$1" -type f)
for file in $files_in_input_recursive; do
    filename=$(basename "$file")
    destination="$2/$filename"
    if [ -e "$destination" ]; then
        counter=1
        while [ -e "$destination" ]; do
            filename="${filename%.*}_$counter.${filename##*.}"
            destination="$2/$filename"
            ((counter++))
        done
    fi
    cp "$file" "$destination"
done