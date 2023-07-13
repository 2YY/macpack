# ターミナル起動時にウェルカムメッセージを表示しない。
set fish_greeting

# タブキーで自動補完を採用する。
bind \t accept-autosuggestion

# Kiex を使えるようにする。
test -s "$HOME/.kiex/scripts/kiex.fish"; and source "$HOME/.kiex/scripts/kiex.fish"

# Starship を起動する。
starship init fish | source

# asdf のパスを通す。
source ~/.asdf/asdf.fish

# asdf の補完が効くようにする
mkdir -p ~/.config/fish/completions; and rm -f -r ~/.config/fish/completions and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
