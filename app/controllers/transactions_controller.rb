class TransactionsController < ApplicationController
  before_action :authenticate_buyer!
  before_action :is_buyer_transa?, only: [:edit]

  def index
  end

  def new
    @newtransaction=Transaction.new
    @offer=offer
  end

  def create
    @offer=offer
    transaction_params = params[:transaction]
    @newtransaction = Transaction.new(transa_adress: @offer.offer_adress,transa_zipcode: @offer.offer_zipcode, transa_quantity: transaction_params[:transa_quantity], transa_date: transaction_params[:transa_date], buyer_id: current_buyer.id, offer_id: params[:offer_id],transa_city: @offer.offer_city,transa_confirmation:false )

    if @newtransaction.save 
      new_quantity=@offer.offer_quantity-@newtransaction.transa_quantity
      @offer.update(:offer_quantity => new_quantity)
      flash[:notice] = "Produit acheté, en attente confirmation producteur"
      redirect_to root_path
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
    @transaction=transaction
    @offer=offer
    if @transaction.update(transaction_update)
      flash[:notice] = "Transaction successfully update"
      redirect_to buyer_path(current_buyer.id)
    else
      render 'edit'
    end
  end

  def destroy
    @transaction=transaction
    @transaction.destroy
    flash[:notice] = "Transaction successfully deleted"
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
      redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end

end
