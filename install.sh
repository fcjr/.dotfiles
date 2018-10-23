#!/bin/bash

windowsUsername="fcjr"

# ask if user wants oh-my-zsh installed
read -p "Install Oh-my-zsh (y/N)? " choice
if [ "$choice" = "Y" ] || [ "$choice" = "y" ]; then
    echo "Installing Oh-my"
    #install zsh & curl
    apt-get install zsh curl

    #change shell to zsh
    chsh -s $(which zsh)

    #install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

#create vim temp directory
mkdir ~/.vimtmpdir

# for over all standard dotfiles
for file in $(find standard/ -name ".*" -type f -printf "%f\n" ); do

    # if dotfile exists in ~ move it to file.old
    if [ -e ~/$file ]; then
        mv -f ~/$file{,.old}
    fi
    # symlink file
    ln -s $PWD/standard/$file ~/$file

    # WSL Specific Configuration
    # if we are running in WSL move the generic files into windows root as well
    if grep -q Microsoft /proc/sys/kernel/osrelease; then
        if [ -e /mnt/c/Users/$windowsUsername/$file ]; then
            mv -f /mnt/c/Users/$windowsUsername/$file{,.old}
            # symlink file
            ln -s $PWD/standard/$file /mnt/c/Users/$windowsUsername/$file
        fi
    fi

done

#WSL Specific Configuration
if grep -q Microsoft /proc/sys/kernel/osrelease; then
    # update VS Code settings
    if [ -e /mnt/c/Users/$windowsUsername/AppData/Roaming/Code/User/settings.json ]; then
        mv -f /mnt/c/Users/$windowsUsername/AppData/Roaming/Code/User/settings.json{,.old}
        ln -s $PWD/other/vscode_settings.json /mnt/c/Users/$windowsUsername/AppData/Roaming/Code/User/settings.json
    fi
fi