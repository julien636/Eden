class ApplicationController < ActionController::Base

  before_action :transa_cart
    def index
    end
  
    def transa_cart
      if current_buyer
      @transa_cart=current_buyer.transactions.where(payment_confirmation:false).size
      
      price=[]
      current_buyer.transactions.where(payment_confirmation:false).each do |transa|
        price << transa.offer.offer_price*transa.transa_quantity
      end
      @transa_cart_price=price.sum
    end
    end
  end
  