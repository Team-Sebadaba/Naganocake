# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'a@a',
   password: '123456'
)

#ジャンル名
Genre.create!(name:"ケーキ")
Genre.create!(name:"プリン")
Genre.create!(name:"焼き菓子")
Genre.create!(name:"キャンディ")

#商品
Item.create!(
   [
    {
      genre_id: 1,
      item_name: "チョコレートケーキ",
      item_introduction: "ほろ苦さが特徴の大人のケーキ。",
      non_taxed: 1200,
      is_active: true,
      #ActiveStorageは active_storage_blobs と active_storage_attachments の二つのテーブルで機能を実現しています
      #ActiveStorage::Blob と　ActiveStorage::Attachment の二つのモデルで構成
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/no_image.jpg")), filename: "no_image.jpg")
    },


    {
      item_name:"ザッハトルテ",
      item_introduction:"スポンジ内部にあんずジャムを塗り重ね、チョコレートフォンダンはしっとり滑らかな食感に仕上げました。",
      non_taxed:2900,
      genre_id:1,
      is_active:true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/no_image.jpg")), filename: "no_image.jpg")
    }
   ]
  )
