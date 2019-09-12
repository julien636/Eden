class Offer < ApplicationRecord
    has_many :transactions
    ## When db product is full
    #belongs_to :product
    belongs_to :farmer
end
