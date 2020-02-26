class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name, blank: false
      t.string :code

      t.timestamps
    end
  end
end
