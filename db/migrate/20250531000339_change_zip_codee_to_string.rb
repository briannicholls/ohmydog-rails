class ChangeZipCodeeToString < ActiveRecord::Migration[8.0]
  def change
    change_column :owners, :zip_code, :string
  end
end
