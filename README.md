# minchalle_rubocop

Rubocop の設定を共通化するためのリポジトリ

# Usage

## 個人の開発環境にインストールして利用する

1. 本リポジトリをクローン
2. gem installする
  ```sh
  # 以前にビルドしたものがあれば削除しておく
  $ rm minchalle_rubocop-*.gem

  # gem を build して install する
  $ gem build minchalle_rubocop.gemspec
  $ gem install minchalle_rubocop-*.gem
  ```
3. `~/.rubocop.yml` の plugins に追加
  ```sh
  # ファイルがない場合は↓で作成できる
  $ echo -e "plugins:\n  - minchalle_rubocop" > ~/.rubocop.yml
  ```

## リポジトリに取り入れる場合

本リポジトリは private repository なので `gem 'minchalle_rubocop', git: 'https://github.com/a10lab/minchalle_rubocop'` にすると認証が求められる。
何かしらの手段で認証情報を渡せば取得できるのでそれでも良いが、CI(特に CircleCI)でも利用することを考えると git submodule として取り込む方が扱いやすいのでおすすめ。

1. git submodule として追加
  ```sh
  $ mkdir -p vendor/gems
  $ git submodule add git@github.com:a10lab/minchalle_rubocop.git vendor/gems/minchalle_rubocop
  $ git submodule update --init
  ```
2. Gemfile を編集 (↓は minchalle_api におけるローカル開発環境およびCIでのみ利用するgroupに追加する例)
  ```ruby
  group :dev_local, :test do
    gem "minchalle_rubocop", path: "vendor/gems/minchalle_rubocop"
  end
  ```
