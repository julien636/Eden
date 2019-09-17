class OffersController < ApplicationController
  before_action :authenticate_buyer!
  def index
    @liste_legumes = []
    @liste_legumineuses =[]
    @liste_cereales =[]
    @liste_fruits = []

    @offers=Offer.all

    @legumes = Product.where(prod_category: "LEGUME").ids
    @legumineuses = Product.where(prod_category: "LEGUMINEUSE").ids
    @cereales = Product.where(prod_category: "CEREALE").ids
    @fruits = Product.where(prod_category: "FRUIT").ids

    @offers.each do |x| 
      if @legumes.include?(x.product_id.to_i)
      @liste_legumes << x
      elsif @legumineuses.include?(x.product_id.to_i)
        @liste_legumineuses << x
      elsif @cereales.include?(x.product_id.to_i)
        @liste_cereales << x 
      elsif @fruits.include?(x.product_id.to_i)
        @liste_fruits << x  
      end
    end
  end

  def show
  end

  def create
  end
end
