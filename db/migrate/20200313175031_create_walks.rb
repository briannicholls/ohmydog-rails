class CreateWalks < ActiveRecord::Migration[6.0]
  def change
    create_table :walks do |t|
      t.datetime :window_start
      t.datetime :window_end
      t.integer :user_id
      t.integer :pet_id
      t.string :notes
      t.string :walk_type
      t.boolean :completed?

      t.timestamps
    end
  end
end
