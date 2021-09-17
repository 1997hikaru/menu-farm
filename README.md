# アプリ名
Menu Farm

## 概要
"食材の出品/購入"とその食材を使った"レシピの投稿"をどちらも行うことができるアプリです。

## 制作背景
最近、コロナ禍でお取り寄せグルメを楽しむ機会や、
ふるさと納税で地域の食材を返礼品として受け取る機会が増えています。
いつも通りの使い方をしても良いのですが、「せっかくであれば美味しい食べ方をしたい」
という気持ちがあり、生産者や商品購入者が自由にレシピを投稿することができるアプリを作りました。

# DEMO

# 工夫したポイント
- itemとmenuを結びつけ、商品の詳細ページからその商品を使ったレシピを
  閲覧できるようにしました。

# 実装予定の内容/課題
- userモデルの修正
  deviseを用いた複数のuserモデルの導入の際に、ルーティングが上手くいかないことが現在の課題です。
  そのため、現時点ではユーザーに区分がなく全てのユーザーがuserモデルに登録されるようになっています。
  修正後は、ユーザーを生産者（出品者）と購入者に区別することで、
  生産者に対するファンを作れるような仕組みを作りたいと考えています。
- レシピ詳細機能をより見やすい仕様に
  現時点では、レシピの材料数・手順数に関わらず一つの要素に箇条書きで入力し、
  そのまま出力される仕様になっています。
  修正後は、一つの材料につき一つの要素、一つの手順につき一つの要素を生成することで、
  材料・手順が増えた場合でもviewが整うようにします。

# DB設計
## usersテーブル
| Column             | Type     | Options                    |
| --------           | -------- | --------                   |
| nickname           | string   | null: false                |
| email              | string   | null: false, unique: true  |
| encrypted_password | string   | null: false                |
| last_name          | string   | null: false                |
| first_name         | string   | null: false                |
| last_name_reading  | string   | null: false                |
| first_name_reading | string   | null: false                |
| birthday           | date     | null: false                |

### Association
- has_many :items
- has_many :purchases
- has_many :menus


## itemsテーブル
| Column             | Type       | Options                         |
| --------           | --------   | --------                        |
| user               | references | null: false, foreign_key: true  |
| item_name          | string     | null: false                     |
| explanation        | text       | null: false                     |
| category_id        | integer    | null: false                     |
| delivery_cost_id   | integer    | null: false                     |
| prefecture_id      | integer    | null: false                     |
| days_delivery_id   | integer    | null: false                     |
| price              | integer    | null: false                     |

### Association
- belongs_to :user
- has_one :purchase
- has_many :menus
- has_one_attached :image

## purchaseテーブル
| Column             | Type      | Options                        |
| --------           | --------  | --------                       |
| user               | reference | null: false, foreign_key: true |
| item               | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
| Column             | Type      | Options                        |
| --------           | --------  | --------                       |
| postal_code        | string    | null: false                    |
| prefecture_id      | integer   | null: false                    |
| municipal          | string    | null: false                    |
| address            | string    | null: false                    |
| building_name      | string    |                                |
| phone_number       | string    | null: false                    |
| purchase           | reference | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## menusテーブル
| Column             | Type      | Options                        |
| --------           | --------  | --------                       |
| item               | reference | null: false, foreign_key: true |
| recipe_title       | string    | null: false                    |
| ingredients_list   | text      | null: false                    |
| step               | text      | null: false                    |
| point              | text      |                                |
| category_id        | integer   | null: false                    |
| menu_category_id   | integer   | null: false                    |

### Association
- belongs_to :user
- belongs_to :item
- has_one_attached :image