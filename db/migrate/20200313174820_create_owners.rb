class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :address
      t.string :apartment_number
      t.integer :zip_code
      t.string :door_code
      t.string :lockbox_code
      t.string :entry_instructions
      t.string :neighbordhood
      t.string :phone2

      t.timestamps
    end
  end
end
