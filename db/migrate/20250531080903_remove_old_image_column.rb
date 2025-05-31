class RemoveOldImageColumn < ActiveRecord::Migration[8.0]
  def change
    remove_column :pets, :image
  end
end
