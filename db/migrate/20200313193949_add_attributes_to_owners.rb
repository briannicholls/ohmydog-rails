class AddAttributesToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :fname, :string
    add_column :owners, :lname, :string
    add_column :owners, :email, :string
    add_column :owners, :phone, :string
  end
end
