#!/bin/sh

# Install Homebrew
if !(type "brew" > /dev/null 2>&1); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update .Brewfile
rm -f ~/.Brewfile
cp .Brewfile ~/.Brewfile

# Install Homebrew packages
brew tap homebrew/cask-fonts
brew update
brew bundle --global

# Install Node.js
asdf plugin list | grep "nodejs"
if [ ! $? = 0 ]; then
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf install nodejs latest
    asdf global nodejs latest
fi

# Install Python
asdf plugin list | grep "python"
if [ ! $? = 0 ]; then
    asdf plugin-add python
    asdf install python latest
    asdf global python latest
fi

# Install AstroNvim
DIR_ASTRO_NVIM="~/.config/nvim/AstroNvim"
if [ ! -d "$DIR_ASTRO_NVIM" ]; then
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
fi
