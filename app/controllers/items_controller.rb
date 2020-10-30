class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to user_session_path
    end
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def set_item
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :detail, :category_id, :status_id, :shipment_source_id, :delivery_charge_id, :period_id, :image).merge(user_id: current_user.id)
  end
end
