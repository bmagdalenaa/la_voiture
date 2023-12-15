class AddAddressAndProvinceToUsers < ActiveRecord::Migration[7.0]
  def change
    # add_column :users, :address, :string
    # add_reference :users, :province, null: true, foreign_key: true
  end
end
