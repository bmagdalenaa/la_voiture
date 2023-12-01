class RenameCarModelTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :car_model, :car_models
  end
end
