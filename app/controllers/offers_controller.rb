class OffersController < ApplicationController
  def index
    @offers=Offer.all
  end

  def show
  end

  def create
  end
end
