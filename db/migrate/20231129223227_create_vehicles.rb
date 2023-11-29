class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_name
      t.integer :model_id
      t.integer :type_id
      t.integer :fuel_id
      t.integer :order_id
      t.float :vehicle_price
      t.string :vin_identification
      t.references :type, null: false, foreign_key: true
      t.references :model, null: false, foreign_key: true
      t.references :fuel, null: false, foreign_key: true
      t.references :order_details, null: false, foreign_key: true

      t.timestamps
    end
  end
end
