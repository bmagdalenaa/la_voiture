class CreateModelColorsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :model_colors do |t|
      t.string :name
      t.references :color, null: false, foreign_key: true
      t.references :car_models, null: false, foreign_key: true

      t.timestamps
    end
  end
end
