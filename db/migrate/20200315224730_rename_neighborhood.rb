class RenameNeighborhood < ActiveRecord::Migration[6.0]
  def change
    rename_column :owners, :neighbordhood, :neighborhood
  end
end
