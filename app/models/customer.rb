class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :orders, dependent: :destroy
    has_many :destinations, dependent: :destroy
    has_many :cart_items, dependent: :destroy

    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :last_furigana, presence: true
    validates :first_furigana, presence: true
    validates :address, presence: true
    validates  :email, presence: true

    VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
    validates :postal, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }


    validates :tel, presence: true, length: { in: 10..11 }

  def address_display
    '〒' + postal + ' ' + address
  end

  def name_display
    last_name + ' ' + first_name
  end
  
  def active_for_authentication?
    super && (is_deleted == false)
  end


end