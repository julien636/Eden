class AddColumnToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :payment_confirmation, :boolean
  end
end
