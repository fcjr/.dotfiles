#!/bin/bash

mkdir ~/.vimtmpdir

# for over all standard dotfiles
for file in $(find standard/ -name ".*" -type f -printf "%f\n" ); do

    # if dotfile exists in ~ move it to file.old
    if [ -e ~/$file ]; then
        mv -f ~/$file{,.old}
    fi
    # symlink file
    ln -s $PWD/standard/$file ~/$file
done
