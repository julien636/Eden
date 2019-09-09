class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.float :offer_quantity
      t.datetime :date_harvest
      t.float :offer_price
      t.string :offer_adress
      t.string :offer_zipcode
      t.string :offer_country

      t.timestamps

      t.references :product, index: true
      t.references :farmer, index: true
    end
  end
end
