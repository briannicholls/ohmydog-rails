class ChangeDefaultRoleForUsers < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :role, :string, default: "employee"
  end
end
