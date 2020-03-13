class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :owner_id
      t.string :breed
      t.datetime :birthday
      t.string :temperament
      t.string :notes
      t.string :appearance
      t.string :image

      t.timestamps
    end
  end
end
