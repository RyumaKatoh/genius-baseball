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