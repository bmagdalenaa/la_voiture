class RenameModelNameToCarModelName < ActiveRecord::Migration[7.0]
  def change
    rename_column :car_models, :model_name, :car_model_name
  end
end
