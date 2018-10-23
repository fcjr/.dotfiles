# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/fcjr/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER="fcjr"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git, wd
)

source $ZSH/oh-my-zsh.sh

## User configuration
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Only show current working directory name
prompt_dir() {
  prompt_segment blue black '%1~'
}

# Disable Auto CD (Fixes issue with running the "go" command in home dir)
unsetopt autocd

# Golang Install
export PATH=$PATH:/usr/local/go/bin

# Miniconda3 Setup
## Allow "conda activate ..." instead of "source activate ..."
. /home/fcjr/miniconda3/etc/profile.d/conda.sh
## Add miniconda to the end of path so that when an env is not
## activated system python is used
export PATH="$PATH:/home/fcjr/miniconda3/bin"

# Haskell Stack Setup
export PATH="/home/fcjr/.local/bin:$PATH"

#WSL Specific Configuration
if grep -q Microsoft /proc/sys/kernel/osrelease; then
  # Docker Setup for WSL
  export DOCKER_HOST=tcp://192.168.99.100:2376
  export DOCKER_CERT_PATH=/mnt/c/Users/fcjr/.docker/machine/certs
  export DOCKER_TLS_VERIFY=1
fi
