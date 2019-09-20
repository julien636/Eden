class Transaction < ApplicationRecord
    belongs_to :offer
    belongs_to :buyer

    def my_date=(val)
        Date.strptime(val, "%d/%m/%Y") if val.present?
      end
end
