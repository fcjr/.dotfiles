# .dotfiles

My personal dotfiles, there are many like them, but these ones are mine.

## Prerequisites

See Brewfile for a list of applications that need to be installed.  You can install them all at once with:

```sh
brew bundle
brew services start colima
yabai --start-service
skhd --start-service
```

Otherwise use your package manager of choice.

## Installation

```sh
git clone git@github.com:fcjr/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make install
```
