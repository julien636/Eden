class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :prod_category
      t.string :prod_name
      t.string :prod_subname
      t.float :prod_price

      t.timestamps
    end
  end
end
