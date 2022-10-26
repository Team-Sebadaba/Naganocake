class Order < ApplicationRecord
  has_many :details, dependent: :destroy
  belongs_to :customer

  def total_amount
    item.with_tax_price * amount
  end

  enum payment: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting_payment: 0, payment: 1, maiking: 2, ready_to_ship: 3, item_shipping: 4 }

  validates :shipping_postal, presence: true
  validates :shipping_address, presence: true
  validates :shipping_name, presence: true

end
