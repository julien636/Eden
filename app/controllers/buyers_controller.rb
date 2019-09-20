class BuyersController < ApplicationController
  before_action :authenticate_buyer!
  

  def show
  end
  
  def edit
    @buyer = current_buyer
  end

  def update
    @buyer = current_buyer
    if @buyer.update(buyer_update)
      flash[:success] = "Profil mis à jour"
      redirect_to @buyer
    else
      render 'edit'
    end
  end

  private
  def buyer_update
    params.require(:buyer).permit(:first_name, :last_name, :buyer_adress,:buyer_city,:buyer_country,:buyer_zipcode, buyer: current_buyer)
  end
 
end
