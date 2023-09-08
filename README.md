### アプリケーション名
Genius Baseball
### アプリケーション概要
野球専門の練習動画管理アプリ。  
投打や取り組みを選択し、動画と見てほしいポイントを投稿する。  
指導者やチームメイトから画像付きのコメントをもらう。  
### URL
  http://18.177.29.179/
### BASIC認証
・ユーザー名：ybcbaseball  
・パスワード：kashiwa2005  
### 利用方法
#### 練習動画の投稿 
1.ログインページよりユーザー新規登録を行う。  
2.ヘッダーの「new practice」を押下し、新規練習投稿画面に遷移する  
3.投打、取り組み内容のプルダウンを選択し、動画と見てほしいポイントを投稿する。（見てほしいポイントは任意）  
#### 他人の練習投稿にコメント
1.トップページの他人の投稿から「コメント（投稿詳細）へ」を押下し、投稿詳細画面に遷移する。  
2.詳細ページの下部にコメントエリアが存在し、動画（画像）付きでコメントを投稿する。（動画や画像は任意）  
#### お気に入り追加
1.トップページの他人の投稿には、右下に「お気に入り」ボタンが存在する。  
2.「お気に入り」ボタンを押下すると、「登録済」に変化する。  
3.headerのユーザー名を押下し、マイページに遷移する  
4.「お気に入り一覧」にタブを切り替えて、先ほどお気に入りした投稿が一番上に来ることを確認する。  
### アプリケーションを作成した背景
日常の練習の中で撮影した練習動画を、自分の画像フォルダで管理しながら、LINEで送るという工程が非常に不便である。
そのためLINEでは日常のやり取りを行い、練習動画のアドバイスや自分の動画管理は野球専門の管理アプリを用いることで区別する。
また、チーム単位でアプリを使用することで、チームメイトや監督コーチに日常の自主練習の内容も見てもらうことができる。
### 要件定義
  (https://docs.google.com/spreadsheets/d/1nPpeGkitFd_Oe-3uQ_aWS41nsE6YCtSGn1e5cBcvQtk/edit#gid=982722306)
### 現在の実装内容（主要部のみ）
[![Image from Gyazo](https://i.gyazo.com/44729187d260774b81224b2c1875bbe2.jpg)](https://gyazo.com/44729187d260774b81224b2c1875bbe2)
[![Image from Gyazo](https://i.gyazo.com/b56faf6feb20393641143a9b091c406d.jpg)](https://gyazo.com/b56faf6feb20393641143a9b091c406d)
[![Image from Gyazo](https://i.gyazo.com/0ab687b2da74ec48c6115e725131add5.jpg)](https://gyazo.com/0ab687b2da74ec48c6115e725131add5)
[![Image from Gyazo](https://i.gyazo.com/a4c20d5f189fe0051f38c27f2d87cb2a.jpg)](https://gyazo.com/a4c20d5f189fe0051f38c27f2d87cb2a)
[![Image from Gyazo](https://i.gyazo.com/d686240c7ac92dc5fd2b192ffb17c169.jpg)](https://gyazo.com/d686240c7ac92dc5fd2b192ffb17c169)
[![Image from Gyazo](https://i.gyazo.com/f51623da25553580a31e90a388ac10a0.jpg)](https://gyazo.com/f51623da25553580a31e90a388ac10a0)
### 開発環境
・フロントエンド：HTML/CSS Javascript  
・バックエンド：Ruby/Ruby on Rails  
・テキストエディタ：Visual Studio Code  
・デプロイ：AWS  
・タスク管理：GitHub  
### 工夫したポイント
1.動画投稿  
新規投稿画面で動画を複数選択することが可能。  
トップページでは最初に登録した動画が1枚だけ表示されるが、投稿詳細に進むと全ての動画を表示する。  
  
2.レスポンシブデザイン  
野球チームの選手や監督が実際に利用するので、PCよりもスマホからサイトにアクセスする機会が多い。  
サイトをレスポンシブ化し、スマホ画面でもトップページや詳細ページのレイアウトがきれいに表示される。  
  
3.ユーザー詳細機能  
headerや投稿者名からマイページに遷移することができる。  
マイページには「自分の投稿一覧」と「他人のお気に入り一覧」をタブの切り替えを用いて1画面に表示。  
他人のユーザー詳細に遷移した場合は、お気に入り一覧はなく、その人の投稿一覧だけを自動で表示する。  
### 改善点（今後、実装する機能）
1.日付検索機能の実装  
2.投稿された動画ファイルの自動圧縮  
3.コメント機能に動画解析AIを搭載  
4.携帯アプリ版を開発  
5.teamテーブルを新たに作り、チーム単位でアカウント付与  

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