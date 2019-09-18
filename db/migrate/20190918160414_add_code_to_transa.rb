class AddCodeToTransa < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :confirmation_code, :integer
  end
end
