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

# Update Alacritty configure file
DIR_ALACRITTY_CONFIG="~/.config/alacritty"
if [ ! -d "$DIR_ALACRITTY_CONFIG" ]; then
  mkdir -p ~/.config/alacritty
fi
rm -f ~/.config/alacritty/alacritty.yml
cp alacritty.yml ~/.config/alacritty/alacritty.yml

# Update fish configure file
DIR_FISH_CONFIG="~/.config/fish"
if [ ! -d "$DIR_FISH_CONFIG" ]; then
  mkdir -p ~/.config/fish
fi
rm -f ~/.config/fish/config.fish
cp config.fish ~/.config/fish/config.fish

# Update starship configure file
DIR_STARSHIP_CONFIG="~/.config"
if [ ! -d "$DIR_STARSHIP_CONFIG" ]; then
  mkdir -p ~/.config
fi
rm -f ~/.config/starship.toml
cp starship.toml ~/.config/starship.toml

# Change default shell to fish
if ! grep -q "fish" /etc/shells; then
  sudo echo /usr/local/bin/fish >> /etc/shells
fi
chsh -s /usr/local/bin/fish

# Install AstroNvim
DIR_ASTRO_NVIM="~/.config/nvim/AstroNvim"
if [ ! -d "$DIR_ASTRO_NVIM" ]; then
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
fi
