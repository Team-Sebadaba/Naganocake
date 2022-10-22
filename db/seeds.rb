# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)













# 15件の情報を作りたい
# 15.times do |n|
#   Customer.create!(
#     id: "id#{i + 1}",
#     last_name: "名前(性)",
#     first_name: "名前（名)",
#     email: "メールアドレス"
#     )
# end

# 1件だけつくる
Customer.create!(
  # [{
    last_name: "名前(性)",
    first_name: "名前（名)",
    last_furigana: "フリガナ(姓)",
    first_furigana: "フリガナ(名)",
    postal: "123456",
    address: "住所",
    tel: "012345",
    email: "hanako@123",
    password: "123456",
    is_deleted: false
  # },
  # { id: "id#{i + 1}",
  #   last_name: "名前(性)",
  #   first_name: "名前（名)",
  #   last_furigana: "フリガナ(姓)",
  #   first_furigana: "フリガナ(名)",
  #   postal: "123456",
  #   address: "住所",
  #   tel: "012345",
  #   email: "hanako@123",
  #   password: "123456",
  #   is_deleted: "FALSE"
  # }]
  )


# 関連付けデータ
# Order.all.each do |order|
#   order.details.create!(
#     amount: "個数",
#     created_at: "購入日時"
#     )
# end

# 4.times do |n|
  Genre.create!(
    name: "ジャンル名"
    )
# end

Item.create!(
    genre_id: 1,
    item_name: "商品名",
    item_introduction: "商品紹介",
    is_active: true,
    non_taxed: 1200
    )

# 15.times do |n|
#   Item.create!(
#     item_name: "商品名",
#     non_taxed: "税抜価格"
#     )
# end
# ActiveStorageのデータ attachメソッドでファイル登録
  # item = Item.create!(
  #   item_name: "商品名",
  #   non_taxed: "税抜価格",
  #   )

  # item.image.attach(io: File.open(Rails.root.join('app/assets/images/no_image.jpg')), filename: 'no_image.jpg')
