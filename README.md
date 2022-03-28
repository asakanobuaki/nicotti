# NICOTTI（ニコッチ）

![twitter-card-img](https://user-images.githubusercontent.com/81806277/160401769-ea46e880-bac4-4e67-b06e-6a54d84fd154.jpg)

URL:https://www.nicotti.jp/

## サービス概要
喫煙者に向けた、「禁煙」ではなく「減煙」を目的とした、喫煙管理アプリです。
NICOTTI(ニコッチ)を育成しながら喫煙を楽しく管理できます。

## アプリを作ったきっかけ


## 主なページと機能
| Topページ | ユーザー登録画面 | ホーム画面 |
|---|---|---|
| <img width="400" alt="スクリーンショット 2022-03-28 22 02 52" src="https://user-images.githubusercontent.com/81806277/160404212-e24d240e-2eb2-475e-8b26-39353f455744.png"> | <img width="399" alt="スクリーンショット 2022-03-28 22 04 41" src="https://user-images.githubusercontent.com/81806277/160404288-1382e75e-49bc-48ff-b31a-c25f0c7f41aa.png"> | <img width="398" alt="スクリーンショット 2022-03-28 22 10 49" src="https://user-images.githubusercontent.com/81806277/160404955-0b80b650-374f-494e-99b6-6ff2403b8442.png"> |
| シンプルでわかりやすいデザインを意識しました。 | 各々のフォームの下にエラーメッセージが表示されるように実装し、ユーザーが操作をしやすいように工夫しています。 | 携帯ゲームのような表示画面で、いかにもキャラクターを飼っているかのような画面設計にしています。喫煙登録に関する操作は全てajax通信で実装し、UXが高まるよう意識して作成しました。 |

| 本日の喫煙記録 | カレンダー機能 | バディ一覧機能 |
|---|---|---|
| <img width="398" alt="スクリーンショット 2022-03-28 22 10 49" src="https://user-images.githubusercontent.com/81806277/160404955-0b80b650-374f-494e-99b6-6ff2403b8442.png"> | <img width="400" alt="week-caledar" src="https://user-images.githubusercontent.com/81806277/160406325-b36f6c71-8d02-4433-9593-31c5d38586d6.png"> | <img width="400" alt="スクリーンショット 2022-03-27 23 51 07" src="https://user-images.githubusercontent.com/81806277/160406405-a1427e1d-00ae-414d-9745-a30b98c42fdc.png"> |
| ホーム画面上で本日の喫煙を分単位で確認できます。喫煙するたびに非同期で喫煙レコードが追加されます。 | 過去の喫煙を分単位で振り返ることができます。「月」「週」「日」の3つの表示モードを実装しています。 | LINEを使用した通知機能のバディ連携先一覧です。バディ連携をしたLINEアカウントのLINE ID使ってLINEのプロフィール情報を取得し表示しています。 |

# 使用技術

### バックエンド

- Ruby 3.0.0
- Rails 6.1.4.4

### フロントエンド

- HTML
- CSS
- Javascript(jQuery)
- Bootstrap5

### インフラ

- Heroku
- PostgreSQL

# ER図

<img width="761" alt="スクリーンショット 2022-03-28 23 06 57" src="https://user-images.githubusercontent.com/81806277/160415994-ca336e02-474c-4db5-af4a-8be2e1dc7d79.png">
