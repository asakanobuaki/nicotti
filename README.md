# NICOTTI（ニコッチ）

![twitter-card-img](https://user-images.githubusercontent.com/81806277/160401769-ea46e880-bac4-4e67-b06e-6a54d84fd154.jpg)

URL:https://www.nicotti.jp/

## サービス概要
喫煙者に向けた、「禁煙」ではなく「減煙」を目的とした、喫煙管理アプリです。</br>
NICOTTI(ニコッチ)を育成しながら一緒に喫煙を楽しく管理できます。</br>
1日の喫煙本数の目標を決め、目標以上の喫煙をすると段々とキャラクターが不健康になり死んでしまうので、</br>
あなたの慈悲の心が「減煙」の手助けをしてくれます。

</br>

より目標を達成できるよう【バディ機能】を搭載していて、家族や友人のLINEに毎日の喫煙を自動で通知することができます。


## アプリを作ったきっかけ


## 主なページと機能
| Topページ | ユーザー登録画面 | ホーム画面 |
| --- | --- | --- |
| <img width="200%" alt="スクリーンショット 2022-03-28 22 02 52" src="https://user-images.githubusercontent.com/81806277/160404212-e24d240e-2eb2-475e-8b26-39353f455744.png"> | <img width="160%" alt="スクリーンショット 2022-03-28 22 04 41" src="https://user-images.githubusercontent.com/81806277/160404288-1382e75e-49bc-48ff-b31a-c25f0c7f41aa.png"> | <img width="200%" alt="スクリーンショット 2022-03-29 11 17 19" src="https://user-images.githubusercontent.com/81806277/160519384-f7d2c9a4-ec51-46d0-8ced-76cbd71cb731.png"> |
| シンプルでわかりやすいデザインを意識しました。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 各々のフォームの下にエラーメッセージが表示されるように実装し、ユーザーが操作をしやすいように工夫しています。 | コチラもシンプルな画面にしています。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 

| ホーム画面 | ステータス変化 | 本日の喫煙記録|
|---|---|---|
| <img width="150%" alt="スクリーンショット 2022-03-28 22 08 17" src="https://user-images.githubusercontent.com/81806277/160519111-682a8b77-7784-41f1-b504-6d2c5d2aa549.png"> | <img width="150%" alt="to_cancer" src="https://user-images.githubusercontent.com/81806277/160519186-8c287e6b-a840-4960-af5c-f2e38c8b026b.gif"> | <img width="150%" alt="honnjituno" src="https://user-images.githubusercontent.com/81806277/160527267-5f7d434f-8e8a-4f8b-bf22-e426ee714bea.gif"> |
| 携帯ゲームのような表示画面で、いかにもキャラクターを飼っているかのような画面設計にしています。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ステータスは【健康】【ハゲ】【がん】の３つで、最後には死を迎えて甦る設計になっています。 操作は全てajax通信で実装し、UXが高まるよう意識して作成しました。 | ホーム画面上で本日の喫煙を分単位で確認できます。喫煙するたびに非同期で喫煙レコードが追加されます。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |

| カレンダー画面 | バディ一覧(LINE連携) | LINEバディ通知画面 |
|---|---|---|
| <img width="200%" alt="week-caledar" src="https://user-images.githubusercontent.com/81806277/160521081-3cd7df94-1efd-46d2-9cef-b6edc2945f72.png"> | <img width="200%" alt="スクリーンショット 2022-03-27 23 51 07" src="https://user-images.githubusercontent.com/81806277/160521906-d10ec3a6-9d64-4755-8ff8-9578e727de0a.png"> | <img width="200%" alt="LINE通知サンプル" src="https://user-images.githubusercontent.com/81806277/160524723-6b1a8d87-da96-4d73-a3a6-7ef226aaaeb0.jpg"> |
| 過去の喫煙を分単位で振り返ることができます。「月」「週」「日」の3つの表示形式で閲覧することができます。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | LINEを使用した通知機能のバディ連携先一覧です。バディ連携をしたLINEアカウントのLINE ID使ってLINEのプロフィール情報を取得し表示しています。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 毎朝7時にバディ連携したNICOTTIユーザーの昨日1日の喫煙本数が自動で通知されます。 |


## 使用技術

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

### API

- LINE Massaging API

# ER図

<img width="761" alt="スクリーンショット 2022-03-28 23 06 57" src="https://user-images.githubusercontent.com/81806277/160415994-ca336e02-474c-4db5-af4a-8be2e1dc7d79.png">
