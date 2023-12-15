class ChangeNameModelToCarModels < ActiveRecord::Migration[7.0]
  def change
    remove_column :vehicles, :model_id, :integer
  end
end
