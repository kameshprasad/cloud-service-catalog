class CreatePricingDimensions < ActiveRecord::Migration[6.0]
  def change
    create_table :pricing_dimensions do |t|
      t.string :rate_code
      t.string :description
      t.string :begin_range
      t.string :end_range
      t.string :unit
      t.string :price_per_unit

      t.references :pricing
      t.timestamps
    end
  end
end
