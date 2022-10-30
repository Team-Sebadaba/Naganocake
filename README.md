# Naganocakeの概要

**〜当アプリケーションは、DMM WEBCAMPのチーム開発の課題として作成した架空のサイトアプリです〜**

**長野県にある小さな洋菓子店『ながのCAKE』の商品を通販する為のECサイトです。**<br>
**通販の注文を受けるほか、商品や注文状況の管理機能も含んだ内容となっております。**

<br>

# 実装機能

### <会員側実装機能>

#### 1. 新規登録

 - 名前、フリガナ、メールアドレス、郵便番号、住所、電話番号、パスワードで登録できる。

#### 2. ログイン

 - メールアドレス、パスワードでログインできる。
 - ログインユーザーのみ利用できる機能が利用できるようになる。

#### 3. ログアウト

 - ログインユーザのみ可能。ログアウトできる。

#### 4. 会員情報編集

 - ログインユーザーのみ利用可能。
 - 新規登録で登録した情報を一通り編集できる。

#### 5. 退会

 - ログインユーザーのみ利用可能。
 - 会員マイページの「退会する」ボタンから退会できる。
   退会処理がされたユーザーは、管理者側の会員一覧で確認した際に、ステータスが"退会"となる。

#### 6. 配送先一覧

 - ログインユーザーのみ利用可能。
 - 会員マイページの配送先「一覧を見る」ボタンから一覧を表示できる。

#### 7. 配送先登録/編集

 - ログインユーザーのみ利用可能。
 - 配送先の新規登録ができる。
 - 登録済みの配送先があれば、「編集する」ボタンから編集ページへ移動できる。
 - 登録済みの配送先があれば、「削除する」ボタンで削除できる。

#### 8. 注文履歴一覧

 - ログインユーザーのみ利用可能。
 - 会員マイページの注文履歴「一覧を見る」ボタンから一覧を表示できる。
 - 過去の注文ごとに、注文日、配送先、注文商品、支払金額、注文ステータスが閲覧できる。

#### 9. 注文履歴詳細

 - ログインユーザーのみ利用可能。
 - 注文履歴一覧ページの注文詳細「表示する」ボタンから、各注文の詳細を表示できる。
 - 注文日、配送先、支払方法、注文商品、注文ステータス、請求情報(商品合計、配送料、総額)、注文内容(商品ごとの商品名、単価、購入個数、小計)が閲覧できる。

#### 10. 商品一覧

 - ログインしていないユーザーも利用可能。
 - 1ページにつき、登録済み商品が8件まで表示される。
 - 商品ごとに、商品画像、商品名、商品の税込価格が確認できる。

#### 11. 商品詳細

 - ログインしていないユーザーは閲覧のみ可能。
 - 商品一覧ページにて各商品リンクから遷移できる。
 - 商品名、説明文、税込価格が閲覧できるほか、
   管理者側で販売ステータスを販売中と指定しているもののみ、個数を選択して「カートに入れる」ことができる。
   ログインユーザー以外が「カートに入れる」ボタンをクリックした場合は、ログインページへ遷移する。

#### 12. カート

 - ログインユーザーのみ利用可能。
 - カートに入っている商品がある場合、商品ごとの税込価格、カートに入っている個数、小計が確認できる。
 - 購入したい個数の変更も行える。
 - カートに入っている商品の削除や、まとめて削除ができる。

#### 13. 注文

 - ログインユーザーのみ利用可能。
 - カートに入れた商品の注文ができる。
 - カートに商品が入っている場合のみ、カートページの「情報入力に進む」ボタンから、情報入力画面へ進むことができる。
   注文情報入力ページでは、支払方法と配送先を選択する。
 - 注文情報入力ページの「確認画面へ進む」ボタンから、注文情報確認ページへ進むことができる。
   注文情報確認ページでは、購入する商品の情報、総額、支払方法、配送先を一通り確認できる。
   「注文を確定する」ボタンをクリックすることで、注文が完了する。

<br>

### <管理者側実装機能>

#### 1. ログイン機能

 - メールアドレス、パスワードでログインできる。
 - ログインした管理者のみ利用できる機能が利用できるようになる。

#### 2. ログアウト

 - ログインした管理者のみ可能。ログアウトできる。

#### 3. 会員一覧

 - ログインした管理者のみ利用可能。
 - 登録されている会員一覧を閲覧できる。
 - 会員ごとに、ID、氏名、メールアドレス、ステータスが確認できる。

#### 4. 会員詳細

 - ログインした管理者のみ利用可能。
 - 会員一覧ページにて各会員リンクから遷移できる。
 - 会員ID、氏名、フリガナ、郵便番号、住所、電話番号、メールアドレス、会員ステータスが閲覧できる。

#### 5. 会員情報編集

 - ログインした管理者のみ利用可能。
 - 会員詳細の「編集する」ボタンから遷移できる。
 - 登録された情報の一通りの編集、ステータスの有効/退会を変更できる。

#### 6. 商品一覧

 - ログインした管理者のみ利用可能。
 - 登録されている商品一覧を閲覧できる。
 - 商品ごとに、商品ID、商品名、税抜価格、ジャンル、販売ステータスを確認できる。

#### 7. 商品詳細

 - ログインした管理者のみ利用可能。
 - 商品一覧ページにて各商品リンクから遷移できる。
 - 商品名、説明文、ジャンル、税込価格(税抜価格)、販売ステータスが確認できる。

#### 8. 商品新規登録

 - ログインした管理者のみ利用可能。
 - 商品一覧ページの＋マークから、商品の新規登録画面へ遷移できる。
 - 商品画像、商品名、商品説明、ジャンル、税抜価格、販売ステータスを登録できる。

#### 9. 商品編集

 - ログインした管理者のみ利用可能。
 - 商品詳細ページの「編集する」ボタンから遷移できる。
 - 新規登録で登録した情報を一通り編集できる。販売ステータスを"販売停止中"にしたものは、
   会員側の商品詳細ページにて「カートへ入れる」ボタンが表示されなくなる。

#### 10. ジャンル一覧

 - ログインした管理者のみ利用可能。
 - 商品ジャンルの閲覧、追加ができる。

#### 11. ジャンル編集

 - ログインした管理者のみ利用可能。
 - ジャンル一覧ページにて各ジャンルリンクから遷移できる。
 - ジャンル名を変更できる。

#### 12. 注文履歴一覧

 - ログインした管理者のみ利用可能。
 - 1ページにつき、全会員の全注文が10件まで表示される。購入日時の新しいものから順に並ぶ。
 - 注文ごとに、購入日時、購入者、注文個数、注文ステータスが確認できる。

<br>

# 環境など

#### 開発環境

Cloud9

#### フレームワーク

Ruby on Rails

#### ライブラリ(使用Gem)

devise<br>
kaminari "ver 1.2.1"<br>
enum_help<br>
active strage<br>
image_processing

<br>

# インストール

Cloud9環境にて、ターミナルで以下のコマンドを実行してください<br>
git clone [git@github.com:Team-Sebadaba/Naganocake.git]

<br>

# 開発者

*にし*<br>
*ゆっきー*<br>
*はせれん*<br>
*ねえさん*
