class CreateProvinces < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.string :province_name
      t.float :pst
      t.float :gst
      t.float :hst
      t.float :total_tax_rate

      t.timestamps
    end
  end
end
