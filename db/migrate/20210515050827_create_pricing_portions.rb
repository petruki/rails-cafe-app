class CreatePricingPortions < ActiveRecord::Migration[6.1]
  def change
    create_table :pricing_portions do |t|
      t.integer :product_id
      t.float :volume_per_unit
      t.string :unit
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
