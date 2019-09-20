class Offer < ApplicationRecord
    has_many :transactions
    ## When db product is full
    belongs_to :product, optional: true
    belongs_to :farmer
end
