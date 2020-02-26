class Product < ApplicationRecord
  belongs_to :service
  has_many :pricings
end
