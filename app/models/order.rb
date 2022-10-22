class Order < ApplicationRecord
  has_many :details, dependent: :destroy
  belongs_to :customer

  enum payment: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting_payment: 0, : 1 }

end
