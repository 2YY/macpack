# macpack

macpack は macOS の環境構築ツールです。

macOS 上で行う様々な作業に必要な環境を自動で構築します。

## 使い方

- [main.command](https://github.com/2YY/macpack/blob/main/main.command) を Finder 上でダブルクリックすると、環境構築が開始します。
- ターミナルを起動して下記を手動で実行して下さい。`asdf` 本体のインストールが完了していても、下記を手動で実行しないと command not found になります。※シェルが `fish` になっていることを実行前に確認して下さい。
  - `source ~/.asdf/asdf.fish`
  - `mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions`
