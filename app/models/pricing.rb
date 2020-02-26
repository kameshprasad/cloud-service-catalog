class Pricing < ApplicationRecord
  belongs_to :product
  has_many :pricing_dimensions

end
