class DefaultUsersToCustomer < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :role, from: 'employee', to: 'customer'
  end
end
