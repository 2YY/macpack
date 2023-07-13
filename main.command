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

# Install asdf
DIR_ASDF="`echo ~/`.asdf"
if [ ! -d "${DIR_ASDF}" ]; then
  git clone https://github.com/asdf-vm/asdf.git "${DIR_ASDF}" --branch v0.12.0
  . "$HOME/.asdf/asdf.sh"
  . "$HOME/.asdf/completions/asdf.bash"
fi

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
DIR_ALACRITTY_CONFIG="`echo ~/`.config/alacritty"
if [ ! -d "${DIR_ALACRITTY_CONFIG}" ]; then
  mkdir -p "${DIR_ALACRITTY_CONFIG}"
fi
cp -f alacritty.yml ${DIR_ALACRITTY_CONFIG}/alacritty.yml

# Update fish configure file
DIR_FISH_CONFIG="`echo ~/`.config/fish"
if [ ! -d "${DIR_FISH_CONFIG}" ]; then
  mkdir -p "${DIR_FISH_CONFIG}"
fi
cp -f config.fish ${DIR_FISH_CONFIG}/config.fish

# Update starship configure file
DIR_STARSHIP_CONFIG="`echo ~/`.config"
if [ ! -d "${DIR_STARSHIP_CONFIG}" ]; then
  mkdir -p "${DIR_STARSHIP_CONFIG}"
fi
cp -f starship.toml ${DIR_STARSHIP_CONFIG}/starship.toml

# Change default shell to fish
DIR_FISH="/usr/local/bin/fish"
DIR_SHELLS="/etc/shells"
if ! grep -q "fish" "${DIR_SHELLS}"; then
  sudo sh -c "echo ${DIR_FISH} > ${DIR_SHELLS}"
fi
chsh -s "${DIR_FISH}"

# Install AstroNvim
DIR_NVIM="`echo ~/`.config/nvim"
if [ ! -d "$DIR_NVIM" ]; then
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim "${DIR_NVIM}"
fi

# Configure Git username/email
git config --global user.name "2YY"
git config --global user.email hkgeuobmaoakneotpuhtesnotekheo@gmail.com
