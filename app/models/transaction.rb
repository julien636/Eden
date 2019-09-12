class Transaction < ApplicationRecord
    belongs_to :offer
    belongs_to :buyer

    validates :transa_quantity, presence:true, numericality: { only_integer: true, greater_than: 0}
    validates :transa_date, presence:true
end
