class Service < ApplicationRecord
  belongs_to :vendor
  has_many :products
  has_many :pricings, through: :products

end
