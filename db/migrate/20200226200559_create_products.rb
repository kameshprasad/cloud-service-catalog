class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :location
      t.string :location_type

      t.references :service

      t.timestamps
    end
  end
end
