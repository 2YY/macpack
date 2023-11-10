#!/bin/bash

# Install Homebrew
if !(type "brew" > /dev/null 2>&1); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Homebrewをインストールしました。"
else
  echo "Homebrewが既にインストール済のため、Homebrewのインストールをスキップします。"
fi

# Update .Brewfile
rm -f ~/.Brewfile
cp .Brewfile ~/.Brewfile
echo ".Brewfileを更新しました。"

# Install Homebrew packages
brew tap homebrew/cask-fonts
brew update
brew bundle --global
echo "Homebrewのパッケージを更新しました。"

# Install asdf
DIR_ASDF="`echo ~/`.asdf"
if [ ! -d "${DIR_ASDF}" ]; then
  git clone https://github.com/asdf-vm/asdf.git "${DIR_ASDF}" --branch v0.12.0
  . "$HOME/.asdf/asdf.sh"
  . "$HOME/.asdf/completions/asdf.bash"
  echo "asdfをインストールしました。"
else
  echo "asdfが既にインストール済のため、asdfのインストールをスキップします。"
fi

# Install Node.js
asdf plugin list | grep "nodejs"
if [ ! $? = 0 ]; then
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs latest
  asdf global nodejs latest
  echo "Node.jsをグローバルにインストールしました。(asdf)"
else
  echo "Node.jsが既にグローバルにインストールされているため、グローバルへのNode.jsのインストールをスキップします。"
fi

# Install Python
asdf plugin list | grep "python"
if [ ! $? = 0 ]; then
  asdf plugin-add python
  asdf install python latest
  asdf global python latest
  echo "Pythonをグローバルにインストールしました。(asdf)"
else
  echo "Pythonが既にグローバルにインストールされているため、グローバルへのPythonのインストールをスキップします。"
fi

# Update Alacritty configure file
DIR_ALACRITTY_CONFIG="`echo ~/`.config/alacritty"
if [ ! -d "${DIR_ALACRITTY_CONFIG}" ]; then
  mkdir -p "${DIR_ALACRITTY_CONFIG}"
fi
cp -f alacritty.yml ${DIR_ALACRITTY_CONFIG}/alacritty.yml
echo "Alacrittyの設定ファイルを更新しました。"

# Update fish configure file
DIR_FISH_CONFIG="`echo ~/`.config/fish"
if [ ! -d "${DIR_FISH_CONFIG}" ]; then
  mkdir -p "${DIR_FISH_CONFIG}"
fi
cp -f config.fish ${DIR_FISH_CONFIG}/config.fish
echo "fishの設定ファイルを更新しました。"

# Update starship configure file
DIR_STARSHIP_CONFIG="`echo ~/`.config"
if [ ! -d "${DIR_STARSHIP_CONFIG}" ]; then
  mkdir -p "${DIR_STARSHIP_CONFIG}"
fi
cp -f starship.toml ${DIR_STARSHIP_CONFIG}/starship.toml
echo "Starshipの設定ファイルを更新しました。"

# Change default shell to fish
DIR_FISH="/usr/local/bin/fish"
DIR_SHELLS="/etc/shells"
if ! grep -q "fish" "${DIR_SHELLS}"; then
  sudo sh -c "echo ${DIR_FISH} > ${DIR_SHELLS}"
  chsh -s "${DIR_FISH}"
  echo "デフォルトのシェルとしてfishを設定しました。"
else
  echo "デフォルトのシェルとしてfishが設定されているため、デフォルトシェルの切替をスキップします。"
fi

# Install AstroNvim
DIR_NVIM="`echo ~/`.config/nvim"
if [ ! -d "$DIR_NVIM" ]; then
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim "${DIR_NVIM}"
  echo "AstroNvimをインストールしました。"
else
  echo "AstroNvimが既にインストール済のため、AstroNvimのインストールをスキップします。"
fi

# Configure Git username/email
git config --global user.name "2YY"
git config --global user.email hkgeuobmaoakneotpuhtesnotekheo@gmail.com
echo "Gitのユーザ名とメールアドレスを設定しました。"

# Download AstroNvim configure files
DIR_ASTRO_NVIM_CONFIG="`echo ~/`.config/nvim"
if [ ! -d "${DIR_ASTRO_NVIM_CONFIG}" ]; then
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
  git clone https://github.com/2YY/astronvim_config ~/.config/nvim/lua/user
  echo "AstroNvimの設定ファイルをインストールしました。"
  echo "※AstroNvim本体の設定ファイルはこれ以降、:AstroUpdate で手動更新して下さい。"
  echo "※AstroNvimのユーザカスタム設定はこれ以降、~/.config/nvim/lua/user に移動し git pull を実行することで手動更新して下さい。"
fi

