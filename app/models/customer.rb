class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :destinations

    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :last_furigana, presence: true
    validates :first_furigana, presence: true
    validates :postal, presence: true
    validates :address, presence: true
    validates :tel, presence: true
    validates :email, presence: true


end
