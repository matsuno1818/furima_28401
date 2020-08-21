class ItemsController < ApplicationController
  # skip_before_action :authenticate_user!, only:[:index, :show]
  before_action :move_to_index,except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
     @item = Item.find(params[:id])
  end

  def edit
     @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
     end
  end
  
  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :text, :genre_id, :state_id, :delivery_id, :prefecture_id, :shipment_id, :price ).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
