class PurchasesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!,only: :index
  before_action :move_to_index,only: :index
  before_action :no_item, only: :index


  def index
    @purchase = PurchaseAddress.new
  end
  
  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:prefecture_id, :city, :house_number, :building, :post_code, :phone_number).merge(user_id: current_user.id,token: params[:token],item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def no_item
    unless @item.purchase == nil
      redirect_to root_path
    end
  end
end
