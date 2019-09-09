class Offer < ApplicationRecord
    has_many :transactions
    belongs_to :product
    belongs_to :farmer
end
