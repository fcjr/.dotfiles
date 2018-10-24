#!/bin/bash

windowsUsername="fcjr"

#for over each dotfile
for file in $(find standard/ -name ".*" -type f -printf "%f\n" ); do
    # if the file is a symlinked, remove symlink
    if [ -h ~/$file ]; then
        rm -f ~/$file
    fi
    #if .old file exists restore it
    if [ -e ~/${file}.old ]; then
        mv -f ~/$file{.old,}
    fi
done
