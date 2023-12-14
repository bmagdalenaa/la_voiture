class CreateVehiclesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_name
      t.float :vehicle_price
      t.string :vin_identification
      t.integer :vehicle_year
      t.references :type, null: false, foreign_key: true
      t.references :car_models, null: false, foreign_key: true
      t.references :fuel, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true

      t.timestamps
    end
  end
end
