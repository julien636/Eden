class OffersController < ApplicationController
  before_action :authenticate_buyer!
  def index
    @offers=Offer.all
  end

  def show
  end

  def create
  end
end
