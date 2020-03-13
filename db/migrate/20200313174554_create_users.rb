class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :fname
      t.string :lname
      t.string :password_digest
      t.string :role, default: 'customer'
      t.string :phone
      t.string :status, default: 'active'

      t.timestamps
    end
  end
end
