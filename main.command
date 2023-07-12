#!/bin/bash

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

# Update Alacritty configure file
DIR_ALACRITTY_CONFIG="~/.config/alacritty"
if [ ! -d "${DIR_ALACRITTY_CONFIG}" ]; then
  mkdir -p "${DIR_ALACRITTY_CONFIG}"
fi
rm -f "${DIR_ALACRITTY_CONFIG}/alacritty.yml"
cp alacritty.yml "${DIR_ALACRITTY_CONFIG}/alacritty.yml"

# Update fish configure file
DIR_FISH_CONFIG="~/.config/fish"
if [ ! -d "${DIR_FISH_CONFIG}" ]; then
  mkdir -p "${DIR_FISH_CONFIG}"
fi
rm -f "${DIR_FISH_CONFIG}/config.fish"
cp config.fish "${DIR_FISH_CONFIG}/config.fish"

# Update starship configure file
DIR_STARSHIP_CONFIG="~/.config"
if [ ! -d "${DIR_STARSHIP_CONFIG}" ]; then
  mkdir -p "${DIR_STARSHIP_CONFIG}"
fi
rm -f "${DIR_STARSHIP_CONFIG}/starship.toml"
cp starship.toml "${DIR_STARSHIP_CONFIG}/starship.toml"

# Change default shell to fish
DIR_FISH="/usr/local/bin/fish"
DIR_SHELLS="/etc/shells"
if ! grep -q "fish" "${DIR_SHELLS}"; then
  sudo sh -c "echo ${DIR_FISH} > ${DIR_SHELLS}"
fi
chsh -s "${DIR_FISH}"

# Install AstroNvim
DIR_NVIM="~/.config/nvim"
if [ ! -d "$DIR_NVIM" ]; then
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim "${DIR_NVIM}"
fi
