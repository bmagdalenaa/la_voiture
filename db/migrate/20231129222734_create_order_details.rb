class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.integer :contact_id
      t.integer :order_number
      t.float :order_price
      t.date :order_date
      t.integer :quantity
      t.float :gst
      t.float :pst
      t.float :harmonized_tax
      t.references :contact_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
