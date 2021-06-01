# Citem


## 概要
子供のおもちゃ・遊具の情報を共有できるアプリケーションです。  
おもちゃの良かった点、悪かった点を記事として投稿できます。


## URL
デプロイが完了次第、載せる予定です。


## テスト用アカウント
ID : test@example.com  
PASS : 123qwe


## 利用方法
- 新規登録でユーザー登録することで、記事を投稿・編集・削除できるようになります。
- ログアウト状態やログイン状態で、記事一覧から詳細ボタンをクリックすることで、記事詳細ページへ遷移します。
- ログイン状態で、記事一覧から編集ボタンをクリックすることで、記事編集ページへ遷移します。
- ログイン状態で、記事一覧または記事詳細から削除ボタンをクリックすることで、記事を削除できます。


## 目指した課題解決
このアプリは、親が子に買うおもちゃを何にするれば良いか悩んだ際に、  
他の方の記事を見て少しでも参考になり、その悩みが解決されるように作成しました。
また、解決した方が新たに記事を書き、それを他の方が見て参考にするサイクルができることを目指しています。


## 実装した機能についての画像やGIFおよびその説明


## 実装予定の機能


# DB設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :posts

## articles テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## ローカルでの動作方法