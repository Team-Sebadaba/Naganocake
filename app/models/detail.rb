class Detail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  # ItemとOrderのモデルが出来たら以下の記述を加える。
  # has_many :detail, dependent: :destroy
end
