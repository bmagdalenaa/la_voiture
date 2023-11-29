class CreateContactLists < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_lists do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :province

      t.timestamps
    end
  end
end
