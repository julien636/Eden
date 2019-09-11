class AddClolumnDateTo < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :transa_date, :datetime
  end
end
