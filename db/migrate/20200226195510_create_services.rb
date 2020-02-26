class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :code
      t.string :pricing_url

      t.references :vendor
      t.timestamps
    end
  end
end
