# ターミナル起動時にウェルカムメッセージを表示しない。
set fish_greeting

# タブキーで自動補完を採用する。
bind \t accept-autosuggestion

# Starship を起動する。
starship init fish | source

# rtx を有効化する。
rtx activate fish | source
