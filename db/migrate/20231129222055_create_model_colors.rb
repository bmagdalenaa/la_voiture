class CreateModelColors < ActiveRecord::Migration[7.0]
  def change
    create_table :model_colors do |t|
      t.integer :model_id
      t.integer :color_id
      t.references :color, null: false, foreign_key: true
      t.references :model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
