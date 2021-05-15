class CreatePricingUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :pricing_units do |t|
      t.integer :product_id
      t.float :volume
      t.string :unit
      t.float :price

      t.timestamps
    end
  end
end
