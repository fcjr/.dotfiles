#!/bin/bash

windowsUsername="fcjr"

#for over each dotfile
for file in $(find generic/ -name ".*" -type f -printf "%f\n" ); do
    # if the file is a symlinked, remove symlink
    if [ -h ~/$file ]; then
        rm -f ~/$file
    fi
    #if .old file exists restore it
    if [ -e ~/${file}.old ]; then
        mv -f ~/$file{.old,}
    fi

    # remove windows symlinks if in wsl
    if grep -q Microsoft /proc/sys/kernel/osrelease; then
        if [ -h /mnt/c/Users/$windowsUsername/$file ]; then
            rm -f /mnt/c/Users/$windowsUsername/$file
        fi
        #if .old file exists restore it
        if [ -e /mnt/c/Users/$windowsUsername/$file ]; then
            mv -f /mnt/c/Users/$windowsUsername/$file{.old,}
        fi
    fi
done

#WSL Specific Configuration
if grep -q Microsoft /proc/sys/kernel/osrelease; then
    # remove VS Code settings
    if [ -h /mnt/c/Users/$windowsUsername/AppData/Roaming/Code/User/settings.json ]; then
        rm -f /mnt/c/Users/$windowsUsername/AppData/Roaming/Code/User/settings.json
    fi
    if [ -e /mnt/c/Users/$windowsUsername/AppData/Roaming/Code/User/settings.json.old ]; then
        mv -f /mnt/c/Users/$windowsUsername/AppData/Roaming/Code/User/settings.json{.old,}
    fi
    #remove wsl.conf and unlink windows ssl keys to wsl
    if [ -h /etc/wsl.conf ]; then
        rm -f /etc/wsl.conf
    fi
    if [ -e /etc/wsl.conf.old ]; then
        mv -f /etc/wsl.conf{.old,}
    fi
    if [ -h ~/.ssh ]; then
        rm -f ~/.ssh
    fi
    if [ -e ~/.ssh.old]; then
        mv ~/.ssh{.old,}
    fi
fi