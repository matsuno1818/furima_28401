class ItemsController < ApplicationController
  # skip_before_action :authenticate_user!, only:[:index, :show]
  before_action :move_to_index,except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :text, :genre, :state, :delivery, :prefecture, :shipment, :price ).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
