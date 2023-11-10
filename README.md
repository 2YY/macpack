# macpack

開発環境自動構築ツール。

2YYの自宅のMacbookに環境構築することだけを目的として開発されていますが、お揃いにしたい方は自由に使うことが出来ます。

## 使い方

Git Clone して下記コマンドを実行するだけ。

`sh main.command`

※ Gitのユーザ名とパスワードが2YYのものになっているので [main.commandの該当箇所](https://github.com/2YY/macpack/blob/develop/main.command#L100) を予め自分のアカウントの記述に書き換えて下さい。このリポジトリを fork して自分用の設定を管理しても良い。

## 概要

- 今のところ、バックエンドがNode.jsなWeb開発に必要なものしか入っていない。必要なものが増えたら今後追加していく。
- メインエディタは [Alacritty](https://github.com/alacritty/alacritty) + [AstroNvim](https://astronvim.com/)
- シェルは [fish](https://fishshell.com/)
- OSにインストールするものは極力 [Homebrew](https://brew.sh/ja/) で管理
- 言語のバージョン管理は [rtx](https://github.com/jdx/rtx) で行う
- Dockerは [Rancher Desktop](https://rancherdesktop.io/) で動かす
