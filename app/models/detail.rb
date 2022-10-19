class Detail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum item_status: { impossible_making: 0, waiting: 1, maiking: 2, complete: 3 }

  # ItemとOrderのモデルが出来たら以下の記述を加える。
  # has_many :post_comments, dependent: :destroy

end
