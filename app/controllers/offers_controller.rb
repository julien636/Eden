class OffersController < ApplicationController
  before_action :authenticate_buyer!
  protect_from_forgery except: :from_category
  def index
    ram
  end

  def show
  end

  def create
  end

  def from_category
    ram
    @offer_filter=[]
    @offers.each do |offer|
      if offer.product.prod_name==Product.find(params[:category]).prod_name
        @offer_filter<<offer
      end
    end
    respond_to do |format|
      format.html {redirect_to offers_path}
      format.js
    end
  end

  def ram
    @offers=[]
    Offer.all.each do |off|
      if (off.product_id.nil? == false)
      if (off.offer_quantity > 0)
        @offers<<off
      end
      end
    end
    @sub_cereals=Product.cereal_prod.to_a.uniq{ |o| o.prod_name}
    @sub_vegetables= Product.vegetable_prod.to_a.uniq{ |o| o.prod_name}
    @sub_legumes=Product.legume_prod.to_a.uniq{ |o| o.prod_name}
    @sub_fruits=Product.fruit_prod.to_a.uniq{ |o| o.prod_name}
    
    @vegetables = Product.vegetable_prod.ids
    @legumes = Product.legume_prod.ids
    @cereals = Product.cereal_prod.ids
    @fruits = Product.fruit_prod.ids

    @li_vegetables = []
    @li_legumes =[]
    @li_cereals =[]
    @li_fruits = []

    @offers.each do |x| 
      if @vegetables.include?(x.product_id.to_i)
      @li_vegetables << x
      elsif @legumes.include?(x.product_id.to_i)
        @li_legumes << x
      elsif @cereals.include?(x.product_id.to_i)
        @li_cereals << x 
      elsif @fruits.include?(x.product_id.to_i)
        @li_fruits << x  
      end
    end
 

  end
end
