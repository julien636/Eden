class AddColumnToBuyers < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :first_name, :string
    add_column :buyers, :last_name, :string
    add_column :buyers, :buyer_zipcode, :string
    add_column :buyers, :buyer_adress, :string
    add_column :buyers, :buyer_city, :string
    add_column :buyers, :buyer_country, :string
    add_column :buyers, :buyer_rating_number, :string, default: 0
    add_column :buyers, :buyer_rating, :string
  end
end
