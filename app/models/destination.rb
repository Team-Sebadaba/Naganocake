class Destination < ApplicationRecord

   belongs_to :customer

   validates :postal, presence: true
   validates :address, presence: true
   validates :name, presence: true

end
