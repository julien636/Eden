class AddColumnConfirmationToTransatcion < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :transa_confirmation, :boolean
  end
end
