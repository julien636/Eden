class CreateFarmers < ActiveRecord::Migration[5.2]
  def change
    create_table :farmers do |t|
      t.string :phone_number
      t.integer :rating_number
      t.float :rating
      t.string :farmer_zipcode
      t.string :farmer_adress
      t.string :farmer_country

      t.timestamps
    end
  end
end
