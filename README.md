### アプリケーション名
Genius Baseball
### アプリケーション概要
野球専門の練習動画管理アプリ。
投打や取り組みを選択し、動画と見てほしいポイントを投稿する。
指導者やチームメイトから画像付きのコメントをもらう。
### URL
  http://18.177.29.179/
### テスト用アカウント
・メールアドレス：未登録
・ログインパスワード：未登録
### 利用方法
#### 服の保存 
1.ログインページよりユーザー新規登録を行う。
2.ヘッダーボタンから、服の情報(ジャンル、ブランド、サイズ、購入日、価格、メモ)を入力し服の収納(=保存)を行う。
#### 服を見返す
1.一覧ページから服をクリックして服の詳細を確認する。
2.詳細ページから服の情報編集、削除を行う。
3.マイリストに追加したい服があれば、一覧ページまたは詳細ページのボタンからマイリストへ追加する。
4.ヘッダーボタンから、マイリスト一覧を確認する。
### アプリケーションを作成した背景
近年ネットで気軽に服を買えるようになった分、自分の服の管理が難しくなった。どこで買ったのか、いつ、どのサイズを買ったのか、すべて把握するのは難しい。そこで写真と共に服の情報を記録できるアプリがあれば、買い物中も、電車の中でネットショッピングしている時も、いつでも見返せて便利だと思い、このアプリを開発することにした。
### 要件定義
  (https://docs.google.com/spreadsheets/d/1q8pd3_UsBF_f3HcpR1JlYPxU_rwwvWo6DpdcFyMNL3I/edit#gid=1785908763)
### 現在の実装内容（主要部のみ）
[![Image from Gyazo](https://gyazo.com/7d6a4f3e884faf9524ca65f7fbeb59f8.png)](https://gyazo.com/7d6a4f3e884faf9524ca65f7fbeb59f8)
[![Image from Gyazo](https://gyazo.com/23c9cba8aec31cab6718b7fc522989e6.png)](https://gyazo.com/23c9cba8aec31cab6718b7fc522989e6)
[![Image from Gyazo](https://gyazo.com/9c4ae94d69af412f0f74cda0ff274e2a.png)](https://gyazo.com/9c4ae94d69af412f0f74cda0ff274e2a)
[![Image from Gyazo](https://gyazo.com/e7156a2203967ec47875eaf1b807a1fd.png)](https://gyazo.com/e7156a2203967ec47875eaf1b807a1fd)
### 実装予定の機能
サブカテゴリーを追加予定。
季節ごとのタグつけ機能を追加予定。
### 開発環境
・フロントエンド：HTML/CSS Javascript
・バックエンド：Ruby/Ruby on Rails
・テキストエディタ：Visual Studio Code
・デプロイ：AWS
・タスク管理：GitHub
### 工夫したポイント
1.フロントエンドに関して
服のアプリということで、見た目は洗練されたシンプルなものになるよう、一覧表示のレイアウトやボタンの配置にはこだわって作成。またジャンル別表示、マイリスト追加は非同期を取り入れ、ユーザーのストレス軽減に努めた。
2.バックエンドに関して
自分の服を管理するアプリなので、情報はなるべく自由に保存できるよう、ジャンルとサイズのみnull falseに設定しました。これからサブカテゴリーによって分けて表示もできるよう、実装予定。
### 改善点
1.サイズ×ジャンル、ジャンル×ブランドなど複雑な検索機能が未実装。
2.画像は複数保存できるので、一覧表示で他の画像のプレビューを非同期で表示できるようにしたい。

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |

### Association

- has_many :practices
- has_many :comments
- has_many :favorites, dependent: :destroy     # ユーザー/お気に入り → 1:多


### practices テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | -------------------------------|
| player_id            | integer    | null: false                    |
| attempt_id           | integer    | null: false                    |
| point                | text       | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_many   :favorites, dependent: :destroy


## comments テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| content    | text       | null: false,                   |
| practice   | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :practice


## favorites テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| practice        | references | null: false, foreign_key: true |

### Association

- belongs_to :practice
- belongs_to :user