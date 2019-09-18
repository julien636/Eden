class CartsController < ApplicationController
    def show
        @transactions = current_buyer.transactions.where(payment_confirmation:false)
        prices = []
        @transactions.each do |x|
           prices << x.offer.offer_price * x.transa_quantity
        $total_price = prices.sum
        end
    end

    def create
        @price_paid=$total_price
        $total_price=0
        @transactions = current_buyer.transactions.where(payment_confirmation:false)
        @transactions.each do |transa|
            transa.update(payment_confirmation:true)
        end
    end
end