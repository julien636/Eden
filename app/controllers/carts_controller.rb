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
        boot_stripe
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
        flash[:primary] = "Produit(s) commandé(s), en attente confirmation producteur"
    end

    private
 
    def boot_twilio
      account_sid = Rails.application.credentials.twilio_sid
      auth_token = Rails.application.credentials.twilio_token
      @client = Twilio::REST::Client.new account_sid, auth_token
    end


    def boot_stripe
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],})

      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @price_paid.to_i,
        description: 'Rails Stripe customer',

        currency: 'eur',
      })
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to cart_path(current_buyer.id)
    end

end