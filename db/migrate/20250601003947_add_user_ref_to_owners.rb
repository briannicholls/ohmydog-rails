class AddUserRefToOwners < ActiveRecord::Migration[8.0]
  def change
    add_reference :owners, :user, null: true, foreign_key: true
  end
end
