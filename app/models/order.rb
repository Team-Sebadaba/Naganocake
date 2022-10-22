class Order < ApplicationRecord
  has_many :details, dependent: :destroy
  belongs_to :customer

  enum payment: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting_payment: 0, payment: 1, maiking: 2, ready_to_ship: 3, item_shipping: 4 }

end
