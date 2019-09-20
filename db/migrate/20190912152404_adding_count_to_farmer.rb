class AddingCountToFarmer < ActiveRecord::Migration[5.2]
  def change
    add_column :farmers, :count, :integer
  end
end
