class DropCarModels < ActiveRecord::Migration[7.0]
  def change
    drop_table :car_models
  end
end
