# Install Homebrew
if type "brew" > /dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update .Brewfile
rm -f ~/.Brewfile
cp .Brewfile ~/.Brewfile

# Install Homebrew packages
brew tap homebrew/cask-fonts
brew update
brew bundle --global
