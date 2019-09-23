class Transaction < ApplicationRecord
    belongs_to :offer
    belongs_to :buyer

    validates :transa_quantity, presence:true
    validates :transa_date, presence:true

    def my_date=(val)
        Date.strptime(val, "%d/%m/%Y") if val.present?
      end
end
