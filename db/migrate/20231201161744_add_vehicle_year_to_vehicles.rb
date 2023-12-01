class AddVehicleYearToVehicles < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :vehicle_year, :integer
  end
end
