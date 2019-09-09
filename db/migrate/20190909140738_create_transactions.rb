class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :transa_adress
      t.string :transa_zipcode
      t.float :transa_quantity

      t.timestamps

      t.references :buyer, index: true
      t.references :offer, index: true
    end
  end
end
