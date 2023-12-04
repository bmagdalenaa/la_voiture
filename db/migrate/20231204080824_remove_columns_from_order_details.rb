class RemoveColumnsFromOrderDetails < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_details, :gst, :float
    remove_column :order_details, :pst, :float
    remove_column :order_details, :harmonized_tax, :float
  end
end
