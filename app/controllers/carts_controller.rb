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

            boot_twilio
            @client.messages.create ({
              from: Rails.application.credentials.twilio_number,
              to: transa.offer.farmer.phone_number,
              body: "Un acheteur souhaite #{transa.offer.offer_quantity}kilos de #{transa.offer.product.prod_subname} pour #{transa.offer.offer_price} par kilo. Pour accepter tapez Y#{transa.offer.id} pour refuser tapez N#{transa.offer.id}"
            })
           transa.offer.farmer.count = 4
           transa.offer.farmer.save
        end

    end

    private
 
    def boot_twilio
      account_sid = Rails.application.credentials.twilio_sid
      auth_token = Rails.application.credentials.twilio_token
      @client = Twilio::REST::Client.new account_sid, auth_token
    end
end