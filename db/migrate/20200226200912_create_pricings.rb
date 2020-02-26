class CreatePricings < ActiveRecord::Migration[6.0]
  def change
    create_table :pricings do |t|
      t.string   :offer_term
      t.datetime :effective_date
      t.datetime :synced_date

      t.references :product
      t.timestamps
    end
  end
end
