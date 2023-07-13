# macpack

macpack は macOS の環境構築ツールです。

macOS 上で行う様々な作業に必要な環境を自動で構築します。

## 使い方

- [main.command](https://github.com/2YY/macpack/blob/main/main.command) を Finder 上でダブルクリックすると、環境構築が開始します。冪等性が有るように作っているため、何度実行しても良いです。
- 基本的に環境構築は上記を実行して終了ですが、必要に応じて下記も実行して下さい。
  - `init_astro_nvim.command`
    - 一度実行するだけで良いです。(2回目以降は、実行しても副作用は無いですが、実行はエラーコードで終了します)
