class TransactionsController < ApplicationController
  before_action :authenticate_buyer!
  before_action :is_buyer_transa?, only: [:edit]

  def new
    @newtransaction=Transaction.new
    @offer=offer
    @same_offers=[]
    Offer.all.each do |offers|
      if (offers.product_id.nil? == false)
      if offers.product.prod_name ==  @offer.product.prod_name && offers!=@offer
        @same_offers << offer
      end
    end
    end
  end

  def create
    @offer=offer
    farmer = @offer.farmer
    transaction_params = params[:transaction]
    @newtransaction = Transaction.new(transa_adress: @offer.offer_adress,transa_zipcode: @offer.offer_zipcode, transa_quantity: transaction_params[:transa_quantity], transa_date: transaction_params[:transa_date], buyer_id: current_buyer.id, offer_id: params[:offer_id],transa_city: @offer.offer_city,transa_confirmation:false,payment_confirmation:false )

    if @newtransaction.save 
      new_quantity=@offer.offer_quantity-@newtransaction.transa_quantity
      @offer.update(:offer_quantity => new_quantity)
      flash[:primary] = "Produit ajouté au panier"
      redirect_to offers_path
    else
      render 'new'
    end
  end

  def show
    @transaction=transaction
    @offer=offer
  end

  def edit
    @transaction=transaction
    @offer=offer
    
  end

  def update
    if @transaction.update(transaction_update)
      flash[:sucess] = "Panier mis à jour"
      redirect_to buyer_path(current_buyer.id)
    else
      render 'edit'
    end
  end

  def destroy
    @transaction=transaction
    if @transaction.payment_confirmation==true 
      update_quantity
      @transaction.destroy
      #refund stripe
      flash[:success] = "Transaction supprimée, vous serez remboursé d'ici quelques jours"
    else
      update_quantity
      @transaction.destroy
      flash[:success] = "Panier mis à jour"
    end
    redirect_to buyer_path(current_buyer.id)
  end

  private
  def transaction_update
    params.require(:transaction).permit(:transa_date, :transa_quantity)
  end

  def transaction
    Transaction.find(params['id'])
  end

  def offer
    Offer.find(params[:offer_id])
  end

  def is_buyer_transa?
    if current_buyer.id!=transaction.buyer_id
      flash[:danger] = "Désolé cette page n'est pas accessible depuis votre profil, merci de vous connecter"
      redirect_to root_path
    end
  end  

  def update_quantity
    new_quantity=@transaction.offer.offer_quantity+@transaction.transa_quantity
    offer.update(:offer_quantity => new_quantity)
  end
end
