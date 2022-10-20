class Detail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  # xxxはアソシエーションが繋がっているテーブル名、class_nameは実際のモデルの名前、foreign_keyは外部キーとして何を持つかを表しています。
  belongs_to :orders, class_name: "Order", foreign_key: "order_id"
  # yyyには架空のテーブル名を、zzzは実際にデータを取得しにいくテーブル名を書きます。
  belongs_to :name, through: :orders, source: :customers

  enum item_status: { impossible_making: 0, waiting: 1, maiking: 2, complete: 3 }

  # ItemとOrderのモデルが出来たら以下の記述を加える。
  # has_many :detail, dependent: :destroy
end
