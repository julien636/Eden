class AddColumnCityToTable < ActiveRecord::Migration[5.2]
  def change
    add_column :farmers, :farmer_city, :string
    add_column :transactions, :transa_city, :string
    add_column :offers, :offer_city, :string
  end
end
